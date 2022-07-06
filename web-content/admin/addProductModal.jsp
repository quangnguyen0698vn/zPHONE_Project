<div class="modal fade" id="addPostModal">
     <div class="modal-dialog modal-lg">
       <div class="modal-content">
         <div class="modal-header bg-primary text-white">
           <h5 class="modal-title">Add Product</h5>
           <button class="btn-close" data-bs-dismiss="modal">
             <!-- <span><i class="fa-regular fa-xmark"></i></span> -->
          </button>
        </div>
        <div class="modal-body">
          <form>
            <!-- Product Name: -->
            <div class="form-group">
              <label for="product_name">Product Name:</label>
              <input type="text" class="form-control" />
            </div>
            <!-- Product Type -->
            <div class="form-group">
              <label for="product_type">Product Type:</label>
              <input type="text" class="form-control" />
            </div>
            <!-- Product Brand -->
            <div class="form-group">
              <label for="product_brand">Product Brand:</label>
              <input type="text" class="form-control" />
            </div>
            <!-- Product Price -->
            <div class="form-group">
              <label for="product_price">Product Price:</label>
              <input type="number" step="0.01" class="form-control" />
            </div>
            <!-- Product Image Link -->
            <div class="form-group">
              <label for="product_img_source">Mockup link:</label>
              <input type="url" class="form-control" />
            </div>

            <!-- Product Description -->
            <div class="form-group">
              <label for="product_des">Product Description:</label>
              <textarea name="editor1" class="form-control"></textarea>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary" data-dismiss="modal">
            Save Changes
          </button>
        </div>
      </div>
    </div>
  </div>