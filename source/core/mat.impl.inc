(*
  This file is part of Delphi-OpenCV-Class project.
  https://github.com/Laex/Delphi-OpenCV-Class

  It is subject to the license terms in the LICENSE file found in the top-level directory
  of this distribution and at https://www.apache.org/licenses/LICENSE-2.0.txt

  Copyright 2021, Laentir Valetov, laex@bk.ru

  Licensed under the Apache License, Version 2.0 (the 'License');
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an 'AS IS' BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
*)

{$IFDEF OPENCV_CORE_MAT_HPP}
{ TMat }

class operator TMatHelper.Implicit(const m: TMatExpr): TMat;
begin
  Operator_Mat_Assign_MatExpr(Result,m);
end;

class operator TMat.Initialize(out Dest: TMat);
begin
  Dest := Constructor_Mat(Dest)^;
end;

class operator TMat.Finalize(var Dest: TMat);
begin
  Destructor_Mat(Dest);
end;

class operator TMat.assign(var Dest: TMat; const [ref] Src: TMat);
begin
  if @Dest <> @Src then
    Operator_Mat_Assign_Const_Mat(Dest, Src);
end;

function TMatHelper.clone: TMat;
begin
  clone_Mat(Self, Result);
end;

procedure TMatHelper.Create(const size: TSize; &type: Int);
begin
  create_Mat(Self, size, &type);
end;

function TMatHelper.diag(d: Int): TMat;
begin
  diag_Mat(Self, Result, d);
end;

function TMatHelper.isContinuous: BOOL;
begin
  Result := isContinuous_Mat(Self);
end;

function TMatHelper.isSubmatrix: BOOL;
begin
  Result := isSubmatrix_Mat(Self);
end;

class operator TMatHelper.BitwiseAnd(const a, b: TMat): TMat;
begin
  bitwise_and(a, b, Result);
end;

class operator TMatHelper.LogicalNot(const m: TMat): TMatExpr;
begin
  operator_MatExpr_LogicalNot_Mat(Result, m);
end;

class function TMatHelper.Mat(const size: TSize; &type: Int): TMat;
begin
  Result := Constructor_Mat(Result, size, &type)^;
end;

function TMatHelper.Mat(const roi: TRect): TMat;
begin
  Result := TMat.Mat(Self, roi);
end;

class function TMatHelper.Mat(const size: TSize; &type: Int; const s: TScalar): TMat;
begin
  Constructor_Mat(Result, size, &type, s);
end;

class function TMatHelper.Mat(rows, cols, &type: Int): TMat;
begin
  Result.Create(rows, cols, &type);
end;

class function TMatHelper.Mat<T>(rows, cols: Int; Data: TArray<TArray<T>>; step: size_t): TMat;
Type
  pType = ^T;
Var
  d: TDataType<T>;
  p: pType;
begin
  p := AllocMem(rows * cols * SizeOf(T));
  try
    for Var i := 0 to cols - 1 do
      for Var j := 0 to rows - 1 do
        p[j * cols + i] := Data[j, i];
    Result := TMat.Mat(rows, cols, d.&type, p, step);
  finally
    FreeMem(p);
  end;
end;

class function TMatHelper.Mat<T>(rows, cols: Int; Data: TArray<T>; step: size_t): TMat;
Var
  d: TDataType<T>;
begin
  Result := TMat.Mat(rows, cols, d.&type, @Data[0], step);
end;

class function TMatHelper.Mat(rows, cols, &type: Int; Data: Pointer; step: size_t): TMat;
begin
  Result:=Constructor_Mat(Result, rows, cols, &type, Data, step)^;
end;

class function TMatHelper.Mat: TMat;
begin
  Result := Constructor_Mat(Result)^;
end;

class function TMatHelper.Mat(const m: TMat; const roi: TRect): TMat;
begin
  Result := Constructor_Mat(Result, m, roi)^;
end;

function TMatHelper.pT<T>(const i0: Int): Pointer;
Type
  pType = ^T;
begin
  // CV_DbgAssert( y == 0 || (data && dims >= 1 && (unsigned)y < (unsigned)size.p[0]) );
{$WARNINGS OFF}
  Result := (Data + step.p[0] * i0);
{$WARNINGS ON}
end;

function TMatHelper.pT<T>(const i0, i1: Int): Pointer;
Type
  pType = ^T;
begin
{$WARNINGS OFF}
  Result := Pointer(Data + step.p[0] * i0 + i1 * SizeOf(T));
{$WARNINGS ON}
end;

procedure TMatHelper.release;
begin
  release_Mat(Self);
end;

procedure TMatHelper.st<T>(const i0, i1: Int; const v: T);
Type
  pType = ^T;
var
  p: pType;
begin
{$WARNINGS OFF}
  p := pType(Data + step.p[0] * i0);
  p[i1] := v;
{$WARNINGS ON}
end;

procedure TMatHelper.st<T>(const i0: Int; const v: T);
Type
  pType = ^T;
begin
  // {$WARNINGS OFF}
  // pType(Data + step.p[0] * i0)^ := v;
  // {$WARNINGS ON}
{$WARNINGS OFF}
  if (isContinuous() or (size.p[0] = 1)) then
  begin
    pType(Data)[i0] := v;
    Exit;
  end;
  if (size.p[1] = 1) then
  begin
    pType(Data + step.p[0] * i0)^ := v; // *(_Tp*)(data + step.p[0] * i0);
    Exit;
  end;
  Var
    i: Int := i0 div cols;
  Var
    j: Int := i0 - i * cols;
  pType(Data + step.p[0] * i0 + j * SizeOf(T))^ := v;
{$WARNINGS ON}
end;

function TMatHelper.step1(i: Int): size_t;
begin
  Result := step1_Mat(Self, i);
end;

procedure TMatHelper.addref;
begin
  addref_Mat(Self);
end;

procedure TMatHelper.assign(const s: TScalar);
begin
  Operator_Mat_Assign_Scalar(Self, s);
end;

function TMatHelper.at<T>(const i0, i1: Int): T;
Type
  pType = ^T;
begin
  // CV_DbgAssert(dims <= 2);
  // CV_DbgAssert(data);
  // CV_DbgAssert((unsigned)i0 < (unsigned)size.p[0]);
  // CV_DbgAssert((unsigned)(i1 * DataType<_Tp>::channels) < (unsigned)(size.p[1] * channels()));
  // CV_DbgAssert(CV_ELEM_SIZE1(traits::Depth<_Tp>::value) == elemSize1());
{$WARNINGS OFF}
  Result := pType(Data + step.p[0] * i0)[i1];
{$WARNINGS ON}
end;

function TMatHelper.at<T>(const i0: Int): T;
Type
  pType = ^T;
begin
  // CV_DbgAssert(dims <= 2);
  // CV_DbgAssert(data);
  // CV_DbgAssert((unsigned)i0 < (unsigned)(size.p[0] * size.p[1]));
  // CV_DbgAssert(elemSize() == sizeof(_Tp));
{$WARNINGS OFF}
  if (isContinuous() or (size.p[0] = 1)) then
    Exit(pType(Data)[i0]);
  if (size.p[1] = 1) then
    Exit((pType(Data + step.p[0] * i0))[0]); // *(_Tp*)(data + step.p[0] * i0);
  Var
    i: Int := i0 div cols;
  Var
    j: Int := i0 - i * cols;
  Exit((pType(Data + step.p[0] * i0))[j]);
{$WARNINGS ON}
end;

function TMatHelper.channels: Int;
begin
  Result := channels_Mat(Self);
end;

function TMatHelper.checkVector(elemChannels, depth: Int; requireContinuous: BOOL): Int;
begin
  Result := checkVector_Mat(Self, elemChannels, depth, requireContinuous);
end;

procedure TMatHelper.Create(rows, cols, &type: Int);
begin
  Constructor_Mat(Self, rows, cols, &type);
end;

function TMatHelper.depth: Int;
begin
  Result := depth_Mat(Self);
end;

function TMatHelper.elemSize: size_t;
begin
  Result := elemSize_Mat(Self);
end;

function TMatHelper.elemSize1: size_t;
begin
  Result := elemSize1_Mat(Self);
end;

function TMatHelper.empty: BOOL;
begin
  Result := empty_Mat(Self);
end;

function TMatHelper.total(startDim, endDim: Int): size_t;
begin
  Result := total_Mat(Self, startDim, endDim);
end;

function TMatHelper.total: size_t;
begin
  Result := total_Mat(Self);
end;

function TMatHelper.&type: Int;
begin
  Result := type_Mat(Self);
end;

class function TMatHelper.zeros(const rows, cols: Int; &type: Int): TMatExpr;
begin
  zeros_Mat(Result, rows, cols, &type);
end;

class function TMatHelper.zeros(const size: TSize; &type: Int): TMatExpr;
begin
  zeros_Mat(Result, size, &type);
end;

class function TMatHelper.Mat<T>(const vec: Vector<T>; copyData: BOOL): TMat;
begin
  Result.Create(vec.size, 1, TTraitsType<T>.Value);
  if (vec.empty()) then
    Exit(TMat.Mat);
  if (not copyData) then
  begin
    Result.step[0] := SizeOf(T);
    Result.step[1] := SizeOf(T);
    Result.datastart := vec.pT(0);
    Result.Data := vec.pT(0);
    Result.datalimit := Result.datastart + Result.rows * Result.step[0];
    Result.dataend := Result.datastart + Result.rows * Result.step[0];
  end
  else
    TMat.Mat(vec.size, 1, TTraitsType<T>.Value, vec.pT(0)).copyTo(Result);
end;

{ TMatHelper }

procedure TMatHelper.copyTo(m: TOutputArray);
begin
  copyTo_Mat(Self, m);
end;

procedure TMatHelper.convertTo(const m: TOutputArray; rtype: Int; alpha, beta: double);
begin
  convertTo_Mat(Self, m, rtype, alpha, beta);
end;

procedure TMatHelper.copyTo(m: TOutputArray; mask: TInputArray);
begin
  copyTo_Mat(Self, m, mask);
end;

class function TMatHelper.eye(rows, cols, &type: Int): TMatExpr;
begin
  eye_Mat(Result, rows, cols, &type);
end;

class function TMatHelper.eye(size: TSize; &type: Int): TMatExpr;
begin
  eye_Mat(Result, size, &type);
end;

class operator TMatHelper.Implicit(const v: Vector<TPoint>): TMat;
begin
  Result := TMat.Mat<TPoint>(v);
end;

class function TMatHelper.ones(rows, cols, &type: Int): TMatExpr;
begin
  Result := ones_Mat(Result, rows, cols, &type)^;
end;

class function TMatHelper.Mat(rows, cols, &type: Int; const s: TScalar): TMat;
begin
  Result := Constructor_Mat(Result, rows, cols, &type, s)^;
end;

class function TMatHelper.ones(ndims: Int; const sz: pInt; &type: Int): TMatExpr;
begin
  Result := ones_Mat(Result, ndims, sz, &type)^;
end;

class function TMatHelper.ones(size: TSize; &type: Int): TMatExpr;
begin
  Result := ones_Mat(Result, size, &type)^;
end;

class operator TMatHelper.Subtract(const m: TMat; const s: TScalar): TMatExpr;
begin
  operator_MatExpr_Subtract_Mat_MatExpr(Result, m, s);
end;

{ TMatExpr }

class operator TMatExpr.assign(var Dest: TMatExpr; const [ref] Src: TMatExpr);
begin
  Operator_MatExpr_Assign_Const_MatExpr(Dest, Src);
end;

class operator TMatExpr.Finalize(var Dest: TMatExpr);
begin
  Destructor_MatExpr(Dest);
end;

class operator TMatExpr.Initialize(out Dest: TMatExpr);
begin
  constructor_MatExpr(Dest);
end;

function TMatExprHelper.size: TSize;
begin
  MatExpr_size(Self, Result);
end;

{ TInputArray }

class function TInputArray.InputArray(const m: TMat): TInputArray;
begin
  Constructor_InputArray(Result, m);
end;

class operator TInputArray.Implicit(const m: TMat): TInputArray;
begin
  Result := TInputArray.InputArray(m);
end;

class function TInputArray.InputArray(const m: TMatExpr): TInputArray;
begin
  Constructor_InputArray(Result, m);
end;

class operator TInputArray.Implicit(const m: TMatExpr): TInputArray;
begin
  Result := TInputArray.InputArray(m);
end;

function TInputArray.getMat(idx: Int): TMat;
begin
  getMat_InputArray(Self, Result, idx);
end;

function TInputArray.getObj: Pointer;
begin
  Result := getObj_InputArray(Self);
end;

class operator TInputArray.Initialize(out Dest: TInputArray);
begin
  Constructor_InputArray(Dest);
end;

class operator TInputArray.Finalize(var Dest: TInputArray);
begin
  Destructor_InputArray(Dest);
end;

function TInputArray.isMat: BOOL;
begin
  Result := isMat_InputArray(Self);
end;

class function TInputArray.noArray: TInputArray;
begin
  noArray_InputOutputArray(TInputOutputArray(Result));
end;

class operator TInputArray.Implicit(const v: Vector < Vector < TPoint >> ): TInputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR_VECTOR) + TTraitsType<TPoint>.Value + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TInputArray.Implicit(const v: Vector<TPoint2f>): TInputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<TPoint2f>.Value + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TInputArray.Implicit(const v: Vector<uchar>): TInputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<uchar>.Value + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TInputArray.Implicit(const v: double): TInputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(FIXED_SIZE) + Int(MATX) + Int(CV_64F) + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(1, 1);
end;

class operator TInputArray.Implicit(const v: Vector<TVec4i>): TInputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<TVec4i>.Value + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TInputArray.Implicit(const v: Vector<TMat>): TInputArray;
begin
  Result.flags := Int(STD_VECTOR_MAT) + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TInputArray.Implicit(const v: TScalar): TInputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(FIXED_SIZE) + Int(MATX) + TTraitsType<double>.Value + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(1, 4);
end;

{ TOutputArray }

class function TOutputArrayHelper.noArray: TOutputArray;
begin
  noArray_InputOutputArray(TInputOutputArray(Result));
end;

class function TOutputArrayHelper.OutputArray(const vec: vector<TMat>): TOutputArray;
begin
  Constructor_OutputArray(Result, vec);
end;

class function TOutputArrayHelper.OutputArray(const m: TMat): TOutputArray;
begin
  Constructor_OutputArray(Result, m);
end;

class operator TOutputArrayHelper.Implicit(const m: TMat): TOutputArray;
begin
  Result := TOutputArray.OutputArray(m);
end;

class operator TOutputArrayHelper.Implicit(const OA: TOutputArray): TMat;
begin
  Assert(TInputArray(OA).isMat);
  Result := pMat(TInputArray(OA).getObj)^;
end;

class operator TOutputArrayHelper.Implicit(const m: vector<TMat>): TOutputArray;
begin
  Result := TOutputArray.OutputArray(m);
end;

class operator TOutputArrayHelper.Implicit(const v: Vector<TPoint>): TOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<TPoint>.Value + Int(ACCESS_WRITE);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TOutputArrayHelper.Implicit(const v: Vector<TPoint2f>): TOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<TPoint2f>.Value + Int(ACCESS_WRITE);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TOutputArrayHelper.Implicit(const v: Vector<uchar>): TOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<uchar>.Value + Int(ACCESS_WRITE);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TOutputArrayHelper.Implicit(const v: Vector<float>): TOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<float>.Value + Int(ACCESS_WRITE);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TOutputArrayHelper.Implicit(const v: Vector<TVec4i>): TOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<TVec4i>.Value + Int(ACCESS_WRITE);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

class operator TOutputArrayHelper.Implicit(const v: Vector < Vector < TPoint >> ): TOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR_VECTOR) + TTraitsType<TPoint>.Value + Int(ACCESS_WRITE);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

{ TInputOutputArray }

class operator TInputOutputArrayHelper.Implicit(const IOA: TInputOutputArray): TMat;
Type
  pMat = ^TMat;
begin
  Assert(IOA.isMat);
  Result := pMat(IOA.getObj)^;
end;

class operator TInputOutputArrayHelper.Implicit(const m: TMat): TInputOutputArray;
begin
  Result.InputOutputArray(m);
end;

procedure TInputOutputArrayHelper.InputOutputArray(const m: TMat);
begin
  Constructor_InputOutputArray(Self, m);
end;

class function TInputOutputArrayHelper.noArray: TInputOutputArray;
begin
  noArray_InputOutputArray(Result);
end;

class operator TInputOutputArrayHelper.Implicit(const IOA: TInputOutputArray): TInputArray;
begin
  Move(IOA, Result, SizeOf(IOA));
end;

class operator TInputOutputArrayHelper.Implicit(const v: Vector<TPoint2f>): TInputOutputArray;
begin
  Result.flags := Int(FIXED_TYPE) + Int(STD_VECTOR) + TTraitsType<TPoint2f>.Value + Int(ACCESS_READ);
  Result.Obj := @v;
  Result.sz := size(0, 0);
end;

{ TInputArrayOfArraysHelper }

class operator TInputArrayOfArraysHelper.Implicit(const v: Vector < Vector < TPoint >> ): TInputArrayOfArrays;
begin
  Result := TInputArrayOfArrays(TInputArray(v));
end;

class operator TInputArrayOfArraysHelper.Implicit(const v: Vector<TMat>): TInputArrayOfArrays;
begin
  Result := TInputArrayOfArrays(TInputArray(v));
end;

{ TMatSize }

class operator TMatSizeHelper.Implicit(const m: TMatSize): TSize;
begin
  operator_MatSize_MatSizeToSize(m, Result);
end;

{ TMatStep }

function TMatStepHelper.GetItems(const index: Int): Int;
begin
  Result := p[index];
end;

procedure TMatStepHelper.setItems(const index, Value: Int);
begin
  p[index] := Value;
end;


{$ENDIF}