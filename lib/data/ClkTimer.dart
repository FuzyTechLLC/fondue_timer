class ClkTimer {
  Duration timeDur;
  Duration _elapsedTime;
  DateTime? _startTime;
  DateTime? _targetTime;
  bool _paused;

  ClkTimer({this.timeDur = Duration.zero})
      : _elapsedTime = Duration.zero,
        _paused = true;

  void start() {
    if (_startTime == null) {
      _startTime = DateTime.now();
    } else {
      _startTime = DateTime.now().subtract(_elapsedTime);
    }
    print(_elapsedTime.toString());

    _targetTime = _startTime!.add(timeDur);
    _paused = false;
  }

  void pause() {
    _elapsedTime = DateTime.now().difference(_startTime!);
    print(_elapsedTime.toString());

    _paused = true;
  }

  void reset() {
    _paused = true;
    _elapsedTime = Duration.zero;
    _targetTime = null;
    _startTime = null;
  }

  Duration get elapsedTime {
    if (_targetTime == null) {
      return Duration.zero;
    }
    if (paused) {
      return _elapsedTime;
    }

    _elapsedTime = DateTime.now().difference(_startTime!);
    return _elapsedTime;
  }

  Duration get remainingTime => timeDur - elapsedTime;

  bool get paused => _paused;
}
