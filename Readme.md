##Bài nộp assignment 02

- Ecclipse:
	Version: 2022-06 (4.24.0)
	Build id: 20220609-1112
- Tomcat: apache-tomcat-9.0.64
- Tính năng rememberMe luôn lưu lại tên user name vào cookie bất kể có đăng nhập thành công hay không (tuy nhiên user name phải đảm bảo là 1 email)
- Nếu người dùng đã đăng nhập thành công, thì trong session nếu về trang chủ và click lại vào login sẽ được redirect thằng về admin dashboard (không cần phải đăng nhập lại)
- Khi tắt browser thì session sẽ kết thúc, đồng nghĩa với user logout, sẽ phải đăng nhập lại
- Link trang chủ khi chạy với port 8080: http://localhost:8080/PRJ321x_Project_2_quangnnFX16178/somepassword
Thông tin đăng nhập (setup ở web.xml)
- user: someone@funix.edu.vn
- password: somepassword
