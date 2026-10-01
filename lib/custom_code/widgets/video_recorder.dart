// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class VideoRecorder extends StatefulWidget {
  const VideoRecorder({
    super.key,
    this.width,
    this.height,
    this.onVideoSaved,
    this.maxVideoDuration,
    this.recordButtonChild,
    this.saveButtonChild,
    this.discardButtonChild,
    this.buttonsColor,
  });

  final double? width;
  final double? height;
  final String? onVideoSaved;
  final double? maxVideoDuration;
  final Widget Function()? recordButtonChild;
  final Widget Function()? saveButtonChild;
  final Widget Function()? discardButtonChild;
  final Color? buttonsColor;

  @override
  State<VideoRecorder> createState() => _VideoRecorderState();
}

class _VideoRecorderState extends State<VideoRecorder> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;
  bool _isPreviewing = false;
  String? _videoPath;
  Timer? _recordingTimer;
  double _recordingProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    _recordingTimer?.cancel();
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
      orElse: () => cameras.first,
    );

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
      enableAudio: true,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  Future<String> _getVideoPath() async {
    final directory = await getTemporaryDirectory();
    return path.join(
        directory.path, '${DateTime.now().millisecondsSinceEpoch}.mp4');
  }

  Future<void> _startRecording() async {
    try {
      await _initializeControllerFuture;
      _videoPath = await _getVideoPath();
      await _controller.startVideoRecording();
      setState(() {
        _isRecording = true;
        _recordingProgress = 0.0;
      });

      if (widget.maxVideoDuration != null) {
        _recordingTimer =
            Timer.periodic(const Duration(milliseconds: 100), (timer) {
          setState(() {
            _recordingProgress += 100 / (widget.maxVideoDuration! * 1000);
            if (_recordingProgress >= 100) {
              _stopRecording();
              timer.cancel();
            }
          });
        });
      }
    } catch (e) {
      _showError('Failed to start recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      _recordingTimer?.cancel();
      final file = await _controller.stopVideoRecording();
      setState(() {
        _isRecording = false;
        _isPreviewing = true;
      });
      await file.saveTo(_videoPath!);
    } catch (e) {
      _showError('Failed to stop recording: $e');
    }
  }

  Future<void> _saveVideo() async {
    if (_videoPath == null) return;

    try {
      if (widget.onVideoSaved != null) {
        // Assuming onVideoSaved is the path where you want to save the video
        await File(_videoPath!).copy(widget.onVideoSaved!);
      } else {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = path.basename(_videoPath!);
        final savedPath = path.join(appDir.path, fileName);
        await File(_videoPath!).copy(savedPath);
      }
      _resetCamera();
    } catch (e) {
      _showError('Failed to save video: $e');
    }
  }

  Future<void> _discardVideo() async {
    try {
      if (_videoPath != null && await File(_videoPath!).exists()) {
        await File(_videoPath!).delete();
      }
      _resetCamera();
    } catch (e) {
      _showError('Failed to discard video: $e');
    }
  }

  void _resetCamera() {
    setState(() {
      _isPreviewing = false;
      _videoPath = null;
      _recordingProgress = 0.0;
    });
    _initializeCamera();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Column(
        children: [
          // Camera Preview or Video Preview
          Expanded(
            child: FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (_isPreviewing && _videoPath != null) {
                    return VideoPlayerWidget(videoPath: _videoPath!);
                  } else {
                    return CameraPreview(_controller);
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

          // Recording Progress
          if (_isRecording && widget.maxVideoDuration != null)
            LinearProgressIndicator(
              value: _recordingProgress / 100,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(
                widget.buttonsColor ?? Theme.of(context).primaryColor,
              ),
            ),

          // Control Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _isPreviewing
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _discardVideo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: widget.discardButtonChild != null
                            ? widget.discardButtonChild!()
                            : const Text('Discard'),
                      ),
                      ElevatedButton(
                        onPressed: _saveVideo,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.buttonsColor ??
                              Theme.of(context).primaryColor,
                        ),
                        child: widget.saveButtonChild != null
                            ? widget.saveButtonChild!()
                            : const Text('Save'),
                      ),
                    ],
                  )
                : Center(
                    child: _isRecording
                        ? ElevatedButton(
                            onPressed: _stopRecording,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: const Text('Stop Recording'),
                          )
                        : ElevatedButton(
                            onPressed: _startRecording,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: widget.buttonsColor ??
                                  Theme.of(context).primaryColor,
                            ),
                            child: widget.recordButtonChild != null
                                ? widget.recordButtonChild!()
                                : const Text('Start Recording'),
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
