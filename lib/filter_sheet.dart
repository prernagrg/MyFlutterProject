import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  String _selectedCategory = 'Sort by';
  String _selectedSortBy = 'Relevance';

  final List<String> _sortByOptions = [
    'Relevance',
    'Distance low to high',
    'Rating High to Low',
    'Cost High to Low',
  ];

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _sortByKey = GlobalKey();
  final GlobalKey _ratingKey = GlobalKey();
  final GlobalKey _offersKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Determine which section is currently visible based on scroll offset
    // This is a simplified approach; accurate calculation requires
    // measuring the render box from GlobalKeys, but fixed offsets work nicely for simple setups.

    double offset = _scrollController.offset;

    String visibleCategory = 'Sort by';
    if (offset > 450) {
      // Approx threshold for Offers
      visibleCategory = 'Offers';
    } else if (offset > 200) {
      // Approx threshold for Rating
      visibleCategory = 'Rating';
    }

    if (_selectedCategory != visibleCategory && !_isScrollingToSection) {
      setState(() {
        _selectedCategory = visibleCategory;
      });
    }
  }

  bool _isScrollingToSection = false;

  void _scrollToSection(GlobalKey key, String category) async {
    setState(() {
      _selectedCategory = category;
      _isScrollingToSection = true;
    });

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        _isScrollingToSection = false;
      });
    } else {
      _isScrollingToSection = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Filters and sortings', style: TextStyle(fontSize: 16)),
              Text(
                'Clear all',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Category Column
              SizedBox(
                width: 96,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCategoryTab(
                        'Sort by',
                        'assets/icons/sort.svg',
                        _sortByKey,
                      ),
                      // SizedBox(height: 8),
                      // _buildSortByColumn('Time', Icons.timer_outlined), // Example if needed later
                      // SizedBox(height: 8),
                      _buildCategoryTab(
                        'Rating',
                        'assets/icons/rating.svg',
                        _ratingKey,
                      ),
                      // SizedBox(height: 8),
                      _buildCategoryTab(
                        'Offers',
                        'assets/icons/offers.svg',
                        _offersKey,
                      ),
                      // SizedBox(height: 8),
                      _buildCategoryTab(
                        'Dish\nprice',
                        'assets/icons/price.svg',
                        null,
                      ),
                      // SizedBox(height: 8),
                      _buildCategoryTab(
                        'Trust\n Makers',
                        'assets/icons/trustmakers.svg',
                        null,
                      ),
                    ],
                  ),
                ),
              ),

              // Right Content Column (Scrollable)
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      // Sort By Section
                      Container(
                        key: _sortByKey,
                        color: Color(0xFFF8FAFE),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sort by',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              ),
                              child: Column(
                                children: _sortByOptions.map((option) {
                                  return _buildRadioOption(option);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Rating Section
                      Container(
                        key: _ratingKey,
                        width: double.infinity,
                        color: Color(0xFFF8FAFE),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Restaurant Rating',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey.withOpacity(0.1),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.black,
                                        size: 16,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Rated 3.5+',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Offers Section
                      Container(
                        key: _offersKey,
                        color: Color(0xFFF8FAFE),
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Offers',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Colors.red,
                                  size: 28,
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                              ),
                              child: Column(
                                children: _sortByOptions.map((option) {
                                  return _buildRadioOption(option);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 300),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, -4),
              ),
            ],
          ),

          child: Row(
            children: [
              SizedBox(
                width: 125,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF7A00),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTab(String title, String icon, GlobalKey? sectionKey) {
    bool isSelected = _selectedCategory == title;

    return GestureDetector(
      onTap: () {
        if (sectionKey != null) {
          _scrollToSection(sectionKey, title);
        } else {
          setState(() {
            _selectedCategory = title;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Color(0xFFFEF3F2)
              : Colors.transparent, // Very light red background from Figma
          border: Border(
            right: BorderSide(
              color: isSelected ? Colors.red : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Row(
          // Using row to easily center contents while filling width
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // Icon(icon, color: isSelected ? Colors.red : Colors.grey[600]),
                SvgPicture.asset(
                  icon,
                  color: isSelected ? Colors.red : Colors.grey[600],
                  height: 14,
                  width: 14,
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.red : Colors.grey[600],
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String title) {
    bool isSelected = _selectedSortBy == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSortBy = title;
        });
      },
      child: Container(
        color: Colors.transparent, // Ensures the whole row is clickable
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  if (!isSelected)
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                ],
                border: Border.all(
                  color: isSelected ? Colors.red : Colors.transparent,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
