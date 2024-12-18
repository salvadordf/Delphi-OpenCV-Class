(*
 This file is part of Delphi-OpenCV-Class project.
 https://github.com/Laex/Delphi-OpenCV-Class

 It is subject to the license terms in the LICENSE file found in the top-level directory
 of this distribution and at https://www.apache.org/licenses/LICENSE-2.0.txt

Copyright 2021, Laentir Valetov, laex@bk.ru

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*)
program introduction_to_svm;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  cpp.utils,
  cv.resource,
  cv.opencv;

begin
  try
    // Set up training data
    // ! [setup1]
    Var
      labels: TArray<Int> := [1, -1, -1, -1];
    var
      trainingData: TArray < TArray < float >> := [[501, 10], [255, 10], [501, 255], [10, 501]];

      // ! [setup2]
    Var
      trainingDataMat: TMat := TMat.Mat<float>(4, 2, trainingData);
    Var
      labelsMat: TMat := TMat.Mat<Int>(4, 1, labels);

      // ! [setup2]

      // Train the SVM
      // ! [init]
    Var
      svm: TPtr<TSVM> := TSVM.create();

      // ! [init]
    svm.v.setType(TSVM.C_SVC);
    svm.v.setKernel(TSVM.LINEAR);
    svm.v.setTermCriteria(TTermCriteria.TermCriteria(TTermCriteria.MAX_ITER, 100, 1E-6));
    // ! [train]

    svm.v.train(trainingDataMat, ROW_SAMPLE, labelsMat);
    // ! [train]

    // Data for visual representation
    Var
      width: Int := 512;
    Var
      height: Int := 512;
    Var
      image: TMat := TMat.zeros(height, width, CV_8UC3);

      // Show the decision regions given by the SVM
      // ! [show]
    Var
      green: TVec3b := [0, 255, 0];

    Var
      blue: TVec3b := [255, 0, 0];

    for Var i: Int := 0 to image.rows - 1 do
      for Var j: Int := 0 to image.cols - 1 do
      begin

        Var
          sampleMat: TMat; // := (Mat_<float>(1, 2) << j, i);
        sampleMat.create(1, 2, CV_32F);
        pFloat(sampleMat.pT<float>(0, 0))^ := j;
        pFloat(sampleMat.pT<float>(0, 1))^ := i;

        Var
          response: float := svm.v.predict(sampleMat);

        if (response = 1) then
          pVec3b(image.pT<TVec3b>(i, j))^ := green
        else if (response = -1) then
          pVec3b(image.pT<TVec3b>(i, j))^ := blue;
      end;

    // ! [show]

    // Show the training data
    // ! [show_data]
    Var
      thickness: Int := -1;
    circle(image, Point(501, 10), 5, Scalar(0, 0, 0), thickness);
    circle(image, Point(255, 10), 5, Scalar(255, 255, 255), thickness);
    circle(image, Point(501, 255), 5, Scalar(255, 255, 255), thickness);
    circle(image, Point(10, 501), 5, Scalar(255, 255, 255), thickness);
    // ! [show_data]

    // Show support vectors
    // ! [show_vectors]
    thickness := 2;

    Var
      sv: TMat := svm.v.getUncompressedSupportVectors();

    for Var i: Int := 0 to sv.rows - 1 do
    begin
      Var
        v: pFloat := sv.pT<float>(i);
      circle(image, Point(Trunc(v[0]), Trunc(v[1])), 6, Scalar(128, 128, 128), thickness);
    end;
    // ! [show_vectors]

    imwrite('result.png', image); // save the image

    imshow('SVM Simple Example', image); // show it to the user
    waitKey();

  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      Readln;
    end;
  end;

end.
