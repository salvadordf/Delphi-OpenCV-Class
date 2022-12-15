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

{$ifdef OPENCV_DNN_DNN_HPP}

{ TNet }

class operator TNet.Initialize(out Dest: TNet); // CV_WRAP Net();  //!< Default constructor.
begin
  Constructor_Net(Dest);
end;

class operator TNet.Finalize(var Dest: TNet); // CV_WRAP ~Net(); //!< Destructor frees the net only if there aren't references to the net anymore.
begin
  Destructor_Net(Dest);
end;

function TNet.forward(const outputName :String = ''):TMat;
begin
 Result := forward_Net(Self,CppString(outputName));
end;

procedure TNet.setPreferableBackend(backendId:int);
begin
  setPreferableBackend_Net(Self,backendId);
end;

procedure TNet.setPreferableTarget(targetId:int);
begin
  setPreferableTarget_Net(Self,targetId);
end;

procedure TNet.setInput( const blob:TInputArray; const name : String {= ''};
                            scalefactor :double {= 1.0}; const mean :TScalar {= Scalar()});
begin
  setInput_Net(Self,blob,name,scalefactor,mean);
end;
                            
procedure TNet.setInput( const blob:TInputArray; const name : String {= ''};
                            scalefactor :double = 1.0);
begin
  setInput(blob,name,scalefactor,Scalar());
end;
                            
procedure TNet.setInput( const blob:TInputArray);
begin
  setInput(blob,'');
end;

//--------------------------

function blobFromImages( const images:TInputArrayOfArrays;  
                         scalefactor:double{=1.0};
                         const size :TSize {= Size()}
                        ):TMat;
begin
  Result := blobFromImages(images,scalefactor,size,Scalar());
end;

function blobFromImages( const images:TInputArrayOfArrays;  
                         scalefactor:double=1.0
                        ):TMat;
begin
  Result := blobFromImages(images,scalefactor,Size());
end;

function readNet(const model:String; const config :String= ''; const framework :String= ''):TNet;
begin
  Result := readNet(CppString(model),CppString(config),CppString(framework));
end;

{$endif}