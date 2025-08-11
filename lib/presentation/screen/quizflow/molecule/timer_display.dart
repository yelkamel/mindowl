import 'package:flutter/material.dart';
import 'package:layou_tools/layou_tools.dart';

class TimerDisplay extends StatefulWidget {
  final int totalSeconds;
  final VoidCallback? onTimeUp;
  final bool isActive;

  const TimerDisplay({
    super.key,
    required this.totalSeconds,
    this.onTimeUp,
    required this.isActive,
  });

  @override
  State<TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay>
    with TickerProviderStateMixin {
  late AnimationController _countdownController;
  late Animation<double> _countdownAnimation;
  int _timeLeft = 15;

  @override
  void initState() {
    super.initState();
    _timeLeft = widget.totalSeconds;
    
    _countdownController = AnimationController(
      duration: Duration(seconds: widget.totalSeconds),
      vsync: this,
    );

    _countdownAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _countdownController, curve: Curves.linear),
    );

    _countdownController.addListener(() {
      if (mounted) {
        setState(() {
          _timeLeft = (widget.totalSeconds * (1 - _countdownController.value)).ceil();
        });

        if (_countdownController.isCompleted) {
          widget.onTimeUp?.call();
        }
      }
    });

    if (widget.isActive) {
      _startTimer();
    }
  }

  @override
  void didUpdateWidget(TimerDisplay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      _startTimer();
    } else if (!widget.isActive && oldWidget.isActive) {
      _stopTimer();
    }
  }

  void _startTimer() {
    _countdownController.reset();
    _countdownController.forward();
  }

  void _stopTimer() {
    _countdownController.stop();
  }

  @override
  void dispose() {
    _countdownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EntranceFader(
      delay: const Duration(milliseconds: 200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: AnimatedBuilder(
                  animation: _countdownAnimation,
                  builder: (context, child) {
                    return CircularProgressIndicator(
                      value: _countdownAnimation.value,
                      strokeWidth: 3,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _timeLeft <= 5
                            ? Colors.red
                            : Theme.of(context).colorScheme.primary,
                      ),
                    );
                  },
                ),
              ),
              Text(
                '$_timeLeft',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: _timeLeft <= 5
                      ? Colors.red
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
