import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class PomodoroClock extends StatefulWidget {
  const PomodoroClock({super.key});

  @override
  State<PomodoroClock> createState() => _PomodoroClockState();
}

class _PomodoroClockState extends State<PomodoroClock> {
  int _selectedTime = 25; // Default timer duration in minutes
  int _remainingTime = 25 * 60; // Remaining time in seconds
  Timer? _timer;
  bool _isRunning = false; 
  bool _timeSelected = false; 

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _timeSelected = true;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer?.cancel();
          _isRunning = false;
        }
      });
    });
  }

  void _pauseTimer() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  void _resetTimer() {
    setState(() {
      _isRunning = false;
      _remainingTime = _selectedTime * 60;
      _timeSelected = false;
    });
    _timer?.cancel();
  }

  String _formatTime(int timeInSeconds) {
    final minutes = timeInSeconds ~/ 60;
    final seconds = timeInSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Pomodoro Timer"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Clock Widget
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: CustomPaint(
                painter: ClockPainter(
                  progress: 1 - (_remainingTime / (_selectedTime * 60)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _formatTime(_remainingTime),
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 30),

          if (!_timeSelected && !_isRunning)
            Column(
              children: [
                const Text("Select Timer Duration (minutes):"),
                Slider(
                  min: 1,
                  max: 60,
                  divisions: 59,
                  value: _selectedTime.toDouble(),
                  label: "$_selectedTime min",
                  onChanged: (value) {
                    setState(() {
                      _selectedTime = value.toInt();
                      _remainingTime = _selectedTime * 60;
                    });
                  },
                ),
              ],
            ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isRunning ? _pauseTimer : _startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text(_isRunning ? "Pause" : "Start"),
              ),
              const SizedBox(width: 20),
              if (_timeSelected)
                ElevatedButton(
                  onPressed: _resetTimer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text("Reset"),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final double progress;

  ClockPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background Circle
    final paintBackground = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Progress Arc
    final paintProgress = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;

    // Border Circle
    final paintBorder = Paint()
      ..color = Colors.grey[400]!
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    // Draw background
    canvas.drawCircle(center, radius, paintBackground);

    // Draw progress arc
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      true,
      paintProgress,
    );

    // Draw border
    canvas.drawCircle(center, radius, paintBorder);
  }

  @override
  bool shouldRepaint(covariant ClockPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
