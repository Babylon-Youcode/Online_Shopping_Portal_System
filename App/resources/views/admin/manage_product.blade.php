@extends('admin/layout')
@section('page_title','Manage Product')
@section('product_select','active')
@section('container')
@if($id>0)
   @php
      $image_required="";
   @endphp
   @else
   @php
      $image_required="required";
   @endphp
@endif
<div class="d-flex justify-content-center">
   <h1 class="mb10">Manage Product</h1>
</div>
@if(session()->has('sku_error'))
<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
   {{session('sku_error')}}  
   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
         <span aria-hidden="true">×</span>
   </button>
</div> 
@endif 	

@error('attr_image.*')
<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
   {{$message}}  
   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
         <span aria-hidden="true">×</span>
   </button>
</div> 
@enderror

@error('images.*')
<div class="sufee-alert alert with-close alert-danger alert-dismissible fade show">
   {{$message}}  
   <button type="button" class="close" data-dismiss="alert" aria-label="Close">
         <span aria-hidden="true">×</span>
   </button>
</div> 
@enderror
<div class="d-flex justify-content-center my-4">
   <a href="{{url('admin/product')}}">
      <button type="button" class="btn btn-lg btn-info btn-block">
      Back
      </button>
      </a>
</div>
<div class="row m-t-30">
   <div class="col-md-12">
      <form action="{{route('product.manage_product_process')}}" method="post" enctype="multipart/form-data">
         <div class="row">
            <div class="col-lg-12">
               <div class="card">
                  <div class="card-body">
                     @csrf
                     <div class="form-group">
                        <label for="name" class="control-label mb-1"> Name</label>
                        <input id="name" value="{{$name}}" name="name" type="text" class="form-control" aria-required="true" aria-invalid="false" required>
                        @error('name')
                        <div class="alert alert-danger" role="alert">
                           {{$message}}		
                        </div>
                        @enderror
                     </div>
                     <div class="form-group">
                        <label for="slug" class="control-label mb-1"> Slug</label>
                        <input id="slug" value="{{$slug}}" name="slug" type="text" class="form-control" aria-required="true" aria-invalid="false" required>
                        @error('slug')
                        <div class="alert alert-danger" role="alert">
                           {{$message}}		
                        </div>
                        @enderror
                     </div>
                     <div class="form-group">
                        <label for="image" class="control-label mb-1"> Image</label>
                        <input id="image" name="image" type="file" class="form-control" aria-required="true" aria-invalid="false" {{$image_required}}>
                        @error('image')
                        <div class="alert alert-danger" role="alert">
                           {{$message}}		
                        </div>
                        @enderror
                        @if($image!='')
                           <a href="{{asset('storage/media/'.$image)}}" target="_blank"><img width="100px" src="{{asset('storage/media/'.$image)}}"class="my-4" /></a>
                        @endif
                     </div>
                     <div class="form-group">
                        <div class="row">
                           <div class="col-md-4">
                              <label for="category_id" class="control-label mb-1"> Category</label>
                              <select id="category_id" name="category_id" class="form-control" required>
                                 <option value="">Select Categories</option>
                                 @foreach($category as $list)
                                 @if($category_id==$list->id)
                                 <option selected value="{{$list->id}}">
                                    @else
                                 <option value="{{$list->id}}">
                                    @endif
                                    {{$list->category_name}}
                                 </option>
                                 @endforeach
                              </select>
                           </div>
                           <div class="col-md-4">
                              <label for="category_id" class="control-label mb-1"> Brand</label>
                              <select id="brand" name="brand" class="form-control" required>
                                 <option value="">Select Brand</option>
                                 @foreach($brands as $list)
                                 @if($brand==$list->id)
                                 <option selected value="{{$list->id}}">
                                    @else
                                 <option value="{{$list->id}}">
                                    @endif
                                    {{$list->name}}
                                 </option>
                                 @endforeach
                              </select>
                           </div>
                           <div class="col-md-4">
                              <label for="model" class="control-label mb-1"> Model</label>
                              <input id="model" value="{{$model}}" name="model" type="text" class="form-control" aria-required="true" aria-invalid="false" required>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <label for="short_desc" class="control-label mb-1"> Short Desc</label>
                        <textarea id="short_desc" name="short_desc" type="text" class="form-control" aria-required="true" aria-invalid="false" required>{{$short_desc}}</textarea>
                     </div>
                     <div class="form-group">
                        <label for="desc" class="control-label mb-1"> Desc</label>
                        <textarea id="desc" name="desc" type="text" class="form-control" aria-required="true" aria-invalid="false" required>{{$desc}}</textarea>
                     </div>
                     <div class="form-group">
                        <label for="keywords" class="control-label mb-1"> Keywords</label>
                        <textarea id="keywords" name="keywords" type="text" class="form-control" aria-required="true" aria-invalid="false" required>{{$keywords}}</textarea>
                     </div>
                     <div class="form-group">
                        <label for="technical_specification" class="control-label mb-1"> Technical Specification</label>
                        <textarea id="technical_specification" name="technical_specification" type="text" class="form-control" aria-required="true" aria-invalid="false" required>{{$technical_specification}}</textarea>
                     </div>
                     <div class="form-group">
                        <label for="uses" class="control-label mb-1"> Uses</label>
                        <textarea id="uses" name="uses" type="text" class="form-control" aria-required="true" aria-invalid="false" required>{{$uses}}</textarea>
                     </div>
                     <div class="form-group">
                        <label for="warranty" class="control-label mb-1"> Warranty</label>
                        <textarea id="warranty" name="warranty" type="text" class="form-control" aria-required="true" aria-invalid="false" required>{{$warranty}}</textarea>
                     </div>

                     <div class="form-group">
                        <div class="row">
                           <div class="col-md-8">
                              <label for="model" class="control-label mb-1"> Lead Time</label>
                              <input id="lead_time" value="{{$lead_time}}" name="lead_time" type="text" class="form-control" aria-required="true" aria-invalid="false">
                           </div>
                           <div class="col-md-4">
                              <label for="model" class="control-label mb-1"> Tax</label>
                              <select id="tax_id" name="tax_id" class="form-control" required>
                                 <option value="">Select Tax</option>
                                 @foreach($taxes as $list)
                                 @if($tax_id==$list->id)
                                 <option selected value="{{$list->id}}">
                                    @else
                                 <option value="{{$list->id}}">
                                    @endif
                                    {{$list->tax_desc}}
                                 </option>
                                 @endforeach
                              </select>
                           </div>
                          
                        </div>
                     </div>

                     <div class="form-group">
                        <div class="row">
                           <div class="col-md-3">
                              <label for="model" class="control-label mb-1"> IS Promo	</label>
                              <select id="is_promo" name="is_promo" class="form-control" required>
                     @if($is_promo=='1')
                     <option value="1" selected>Yes</option>
                     <option value="0">No</option>
                     @else
                     <option value="1">Yes</option>
                     <option value="0" selected>No</option>
                     @endif
                              </select>
                           </div>
                           <div class="col-md-3">
                              <label for="model" class="control-label mb-1"> IS Featured	</label>
                              <select id="is_featured" name="is_featured" class="form-control" required>
                     @if($is_featured=='1')
                     <option value="1" selected>Yes</option>
                     <option value="0">No</option>
                     @else
                     <option value="1">Yes</option>
                     <option value="0" selected>No</option>
                     @endif
                              </select>
                           </div>
                           <div class="col-md-3">
                              <label for="model" class="control-label mb-1"> IS Tranding	</label>
                              <select id="is_tranding" name="is_tranding" class="form-control" required>
                     @if($is_tranding=='1')
                     <option value="1" selected>Yes</option>
                     <option value="0">No</option>
                     @else
                     <option value="1">Yes</option>
                     <option value="0" selected>No</option>
                     @endif
                              </select>
                           </div>
                           <div class="col-md-3">
                              <label for="model" class="control-label mb-1"> IS Discounted	</label>
                              <select id="is_discounted" name="is_discounted" class="form-control" required>
                     @if($is_discounted=='1')
                     <option value="1" selected>Yes</option>
                     <option value="0">No</option>
                     @else
                     <option value="1">Yes</option>
                     <option value="0" selected>No</option>
                     @endif
                              </select>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <h2 class="mb10 ml15">Product Images</h2>
            <div class="col-lg-12">
               <div class="card">
                  <div class="card-body">
                     <div class="form-group">
                        <div class="row" id="product_images_box">
                        @php 
                        $loop_count_num=1;
                        @endphp
                        @foreach($productImagesArr as $key=>$val)
                        @php 
                        $loop_count_prev=$loop_count_num;
                        $pIArr=(array)$val;
                        @endphp
                        <input id="piid" type="hidden" name="piid[]" value="{{$pIArr['id']}}">
                        <div class="col-md-4 product_images_{{$loop_count_num++}}"  >
                              <label for="images" class="control-label mb-1"> Image</label>
                              <input id="images" name="images[]" type="file" class="form-control" aria-required="true" aria-invalid="false" >

                              @if($pIArr['images']!='')
                                 <a href="{{asset('storage/media/'.$pIArr['images'])}}" target="_blank"><img width="100px" src="{{asset('storage/media/'.$pIArr['images'])}}" class="my-4"/></a>
                              @endif
                           </div>
                           
                           <div class="col-md-2">
                              <label for="images" class="control-label mb-1"> 
                              &nbsp;&nbsp;&nbsp;</label>
                              
                              @if($loop_count_num==2)
                                <button type="button" class="au-btn au-btn--block au-btn--green mb-20" onclick="add_image_more()">
                                <i class="fa fa-plus"></i>&nbsp; Add</button>
                              @else
                              <a href="{{url('admin/product/product_images_delete/')}}/{{$pIArr['id']}}/{{$id}}"><button type="button" class="btn btn-danger btn-lg">
                                <i class="fa fa-minus"></i>&nbsp; Remove</button></a>
                              @endif  

                           </div>
                           @endforeach
                        </div>
                     </div>
                  </div>
               </div>
               
            </div>
            <h2 class="mb10 ml15">Product Attributes</h2>
            <div class="col-lg-12" id="product_attr_box">
               @php 
               $loop_count_num=1;
               @endphp
               @foreach($productAttrArr as $key=>$val)
               @php 
               $loop_count_prev=$loop_count_num;
               $pAArr=(array)$val;
               @endphp
               <input id="paid" type="hidden" name="paid[]" value="{{$pAArr['id']}}">
               <div class="card" id="product_attr_{{$loop_count_num++}}">
                  <div class="card-body">
                     <div class="form-group">
                        <div class="row">
                           <div class="col-md-2">
                              <label for="sku" class="control-label mb-1"> SKU</label>
                              <input id="sku" name="sku[]" type="text" class="form-control" aria-required="true" aria-invalid="false" value="{{$pAArr['sku']}}" required>
                           </div>
                           <div class="col-md-2">
                              <label for="mrp" class="control-label mb-1"> MRP</label>
                              <input id="mrp" name="mrp[]" type="number" class="form-control" aria-required="true" aria-invalid="false" value="{{$pAArr['mrp']}}" required>
                           </div>
                           <div class="col-md-2">
                              <label for="price" class="control-label mb-1"> Price</label>
                              <input id="price" name="price[]" type="number" class="form-control" aria-required="true" aria-invalid="false" value="{{$pAArr['price']}}" required>
                           </div>
                           
                           <div class="col-md-3">
                              <label for="color_id" class="control-label mb-1"> Color</label>
                              <select id="color_id" name="color_id[]" class="form-control">
                                 <option value="">Select</option>
                                 @foreach($colors as $list)
                                    @if($pAArr['color_id']==$list->id)
                                    <option value="{{$list->id}}" selected>{{$list->color}}</option>
                                    @else
                                    <option value="{{$list->id}}">{{$list->color}}</option>
                                    @endif
                                 @endforeach
                              </select>
                           </div>
                           <div class="col-md-2">
                              <label for="qty" class="control-label mb-1"> Qty</label>
                              <input id="qty" name="qty[]" type="number" class="form-control" aria-required="true" aria-invalid="false" value="{{$pAArr['qty']}}" required>
                           </div>
                           <div class="col-md-4">
                              <label for="attr_image" class="control-label mb-1"> Image</label>
                              <input id="attr_image" name="attr_image[]" type="file" class="form-control" aria-required="true" aria-invalid="false" >

                              @if($pAArr['attr_image']!='')
                                 <img width="100px" src="{{asset('storage/media/'.$pAArr['attr_image'])}}" class="my-4"/>
                              @endif
                           </div>
                           <div class="col-md-2">
                              <label for="attr_image" class="control-label mb-1"> 
                              &nbsp;&nbsp;&nbsp;</label>
                              
                              @if($loop_count_num==2)
                                <button type="button" class="au-btn au-btn--block au-btn--green mb-20" onclick="add_more()">
                                <i class="fa fa-plus"></i>&nbsp; Add</button>
                              @else
                              <a href="{{url('admin/product/product_attr_delete/')}}/{{$pAArr['id']}}/{{$id}}"><button type="button" class="btn btn-danger btn-lg my-4">
                                <i class="fa fa-minus"></i>&nbsp; Remove</button></a>
                              @endif  

                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               @endforeach
            </div>
         </div>
         <div>
            <button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
            Submit
            </button>
         </div>
         <input type="hidden" name="id" value="{{$id}}"/>
      </form>
   </div>
</div>
@endsection