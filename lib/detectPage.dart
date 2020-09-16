import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tensorflow_lite_flutter/helpers/app_helper.dart';
import 'package:tensorflow_lite_flutter/helpers/camera_helper.dart';
import 'package:tensorflow_lite_flutter/helpers/tflite_helper.dart';
import 'package:tensorflow_lite_flutter/models/result.dart';
import 'beerInfoPage.dart';
import 'fadeInTransition.dart';

class DetectPage extends StatefulWidget {
  @override
  _DetectPageState createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> with TickerProviderStateMixin {
  AnimationController _colorAnimController;
  Animation _colorTween;

  List<Result> outputs;

  bool loaded = false;

  load() {
    Future.delayed(const Duration(seconds: 2), () => loaded = true);
  }

  void initState() {
    super.initState();

    //Load TFLite Model
    TFLiteHelper.loadModel().then((value) {
      if (mounted) {
        setState(() {
          TFLiteHelper.modelLoaded = true;
          load();
        });
      }
    });

    //Initialize Camera
    CameraHelper.initializeCamera();

    //Setup Animation
    _setupAnimation();

    //Subscribe to TFLite's Classify events
    TFLiteHelper.tfLiteResultsController.stream.listen(
        (value) {
          value.forEach((element) {
            _colorAnimController.animateTo(element.confidence,
                curve: Curves.bounceIn, duration: Duration(milliseconds: 500));
          });

          //Set Results
          outputs = value;

          //Update results on screen
          if (mounted) {
            setState(() {
              //Set bit to false to allow detection again
              CameraHelper.isDetecting = false;
            });
          }
        },
        onDone: () {},
        onError: (error) {
          AppHelper.log("listen", error);
        });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (loaded == true && outputs[0].confidence >= 0.995) {
        CameraHelper.camera.dispose();

        Navigator.push(
          context,
          FadeInTransition(
            builder: (context) => BeerInfoPage(
              label: outputs[0].label,
            ),
          ),
        );
      }
    });

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<void>(
        future: CameraHelper.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Stack(
              children: <Widget>[
                CameraPreview(CameraHelper.camera),
                _buildResultsWidget(width, outputs)
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    TFLiteHelper.disposeModel();
    CameraHelper.camera.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  void deactivate() {
    TFLiteHelper.disposeModel();
    CameraHelper.camera.dispose();
    super.dispose();
  }

  Widget _buildResultsWidget(double width, List<Result> outputs) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              const Radius.circular(12.0),
            ),
          ),
          height: 160.0,
          width: width,
          child: outputs != null && outputs.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        outputs[0].label,
                        style: TextStyle(
                          color: _colorTween.value,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 16),
                      AnimatedBuilder(
                        animation: _colorAnimController,
                        builder: (context, child) => LinearPercentIndicator(
                          width: width * 0.88,
                          lineHeight: 14.0,
                          percent: outputs[0].confidence,
                          progressColor: _colorTween.value,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "${(outputs[0].confidence * 100.0).toStringAsFixed(2)} %",
                        style: TextStyle(
                          color: _colorTween.value,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Text("Wating for model to detect..",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ))),
        ),
      ),
    );
  }

  void _setupAnimation() {
    _colorAnimController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _colorTween = ColorTween(begin: Colors.red, end: Colors.green)
        .animate(_colorAnimController);
  }
}
