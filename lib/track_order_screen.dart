import 'package:flutter/material.dart';

enum TrackerStepState { completed, active, inactive }

class TrackerStepData {
  final String title;
  final String subtitle;

  const TrackerStepData({required this.title, required this.subtitle});
}

class TrackOrderScreen extends StatelessWidget {
  final int currentStep;

  const TrackOrderScreen({super.key, this.currentStep = 6});

  final List<TrackerStepData> steps = const [
    TrackerStepData(title: 'Order Confirmed', subtitle: '12:00 PM'),
    TrackerStepData(
      title: 'Food is Preparing',
      subtitle: 'Your food is being freshly prepared.',
    ),
    TrackerStepData(
      title: 'Rider Assigned',
      subtitle: 'Your rider has been assigned to pick up the order.',
    ),
    TrackerStepData(
      title: 'Pickup',
      subtitle: 'Your rider has picked up the order.',
    ),
    TrackerStepData(title: 'On The Way', subtitle: 'Your order is on the way.'),
    TrackerStepData(
      title: 'Delivered',
      subtitle: 'Your order has been delivered successfully.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Progress',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 32),
                ...List.generate(steps.length, (index) {
                  return TrackerStepWidget(
                    data: steps[index],
                    isLast: index == steps.length - 1,
                    state: _getStepState(index),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TrackerStepState _getStepState(int index) {
    if (index < currentStep) {
      return TrackerStepState.completed;
    } else if (index == currentStep) {
      return TrackerStepState.active;
    } else {
      return TrackerStepState.inactive;
    }
  }
}

class TrackerStepWidget extends StatelessWidget {
  final TrackerStepData data;
  final bool isLast;
  final TrackerStepState state;

  const TrackerStepWidget({
    super.key,
    required this.data,
    required this.isLast,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                _buildIndicator(),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: state == TrackerStepState.completed
                          ? const Color(0xFFFF7A00)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: state == TrackerStepState.active
                          ? FontWeight.bold
                          : FontWeight.w600,
                      color: _getTitleColor(),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: _getSubtitleColor(),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    switch (state) {
      case TrackerStepState.completed:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFFFF7A00),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 16),
        );
      case TrackerStepState.active:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFFF7A00), width: 2),
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFFFF7A00),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      case TrackerStepState.inactive:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFFE2E8F0),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF94A3B8),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
    }
  }

  Color _getTitleColor() {
    switch (state) {
      case TrackerStepState.completed:
        return const Color(0xFF1E293B);
      case TrackerStepState.active:
        return const Color(0xFFFF7A00);
      case TrackerStepState.inactive:
        return const Color(0xFF64748B);
    }
  }

  Color _getSubtitleColor() {
    switch (state) {
      case TrackerStepState.completed:
      case TrackerStepState.active:
        return const Color(0xFF64748B);
      case TrackerStepState.inactive:
        return const Color(0xFF94A3B8);
    }
  }
}
