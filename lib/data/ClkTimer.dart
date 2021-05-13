class ClkTimer {
  Duration _timeDur;
  Duration _elapsedTime;
  DateTime? _startTime;
  DateTime? _targetTime;
  bool _paused;

  ClkTimer({Duration duration = Duration.zero})
      : _elapsedTime = Duration.zero,
        _paused = true,
        _timeDur = duration;

  void start() {
    if (_startTime == null) {
      _startTime = DateTime.now();
    } else {
      _startTime = DateTime.now().subtract(_elapsedTime);
    }

    _targetTime = _startTime!.add(_timeDur);
    _paused = false;
  }

  void pause() {
    _elapsedTime = DateTime.now().difference(_startTime!);

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

  Duration get remainingTime => _timeDur - elapsedTime;

  Duration get timeDur => _timeDur;
  Duration get duration => _timeDur;

  set duration(Duration d) {
    reset();
    _timeDur = d;
    reset();
  }



  bool get paused => _paused;
}
