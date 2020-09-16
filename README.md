# Beer Buddy

A flutter app to demonstrate the usage of tensor flow lite ML applied to everyone's favourite beverage.


The "TensorFlow" model is trained using [Teachable Machines](https://teachablemachine.withgoogle.com/train). The model is trained with different pictures of beer bottle labels. 
The app will recognize the labels and classify the beer accordingly. It uses a pre-trained model and does classification of frames received from the Camera Controller. The app will show the most relevant result in real-time along with the confidence percentage.
When the confidence exceeds 99.5%, the beer is identified and an info page will automatically open.

Model can be downloaded from this [download link](https://drive.google.com/file/d/1IIUr2OVBKPS12rXb8F13n87Ypqj-9GBO/view?usp=sharing) and re-loaded on "Teachable Machines" website.

## TFLite Helper Class

```dart
    // Load Model
    static Future<String> loadModel() async{
        AppHelper.log("loadModel", "Loading model..");
    
        return Tflite.loadModel(
          model: "assets/model_unquant.tflite",
          labels: "assets/labels.txt",
        );
    }
    
    //Start Classification on CameraImage frames
    static classifyImage(CameraImage image) async {
    
        await Tflite.runModelOnFrame(
                bytesList: image.planes.map((plane) {
                  return plane.bytes;
                }).toList(),
                numResults: 5)
            .then((value) {
      
          //Send results
          tfLiteResultsController.add(_outputs);
        });
    }
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
