<div class="modal fade" id="addUserModal">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header bg-warning text-white">
				<h5 class="modal-title">Sign Up</h5>
				<button class="btn-close" data-bs-dismiss="modal">
					<!-- <span><i class="fa-regular fa-xmark"></i></span> -->
				</button>
			</div>
			<div class="modal-body">
				<form id="signUpForm">
					<div class="form-group">
						<label for="email">Email</label> <input type="email" name="email"
							id="email" class="form-control" />
					</div>

					<div class="form-group">
						<label for="password">Password</label> <input type="password"
							name="password" id="password" class="form-control" />
					</div>

					<div class="form-group">
						<label for="password2">Confirm Password</label> <input
							type="password" name="password2" id="password2"
							class="form-control" />
					</div>

					<div class="form-group">
						<label for="name">Name</label> <input type="text" name="name"
							id="name" class="form-control" />
					</div>

					<div class="form-group">
						<label for="address">Address</label> <input type="text"
							name="address" id="address" class="form-control" />
					</div>

					<div class="form-group">
						<label for="phone">Phone</label> <input type="text" name="phone"
							id="phone" class="form-control" />
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" form="signUpForm" formaction="signup" formmethod="POST" class="btn btn-warning" data-dismiss="modal">
					Submit</button>
			</div>
		</div>
	</div>
</div>
