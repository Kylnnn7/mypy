# Tiểu luận PRJ-35 — các file đang dùng

## Mở nhanh

- [Báo cáo PDF](tieu_luan_prj35.pdf) · [Nguồn báo cáo](tieu_luan_prj35.qmd)
- [Lộ trình PDF](lo_trinh_thuc_hien_prj35.pdf) · [Lộ trình nguồn duy nhất](lo_trinh_thuc_hien_prj35.qmd)
- [Notebook chính](tieu_luan_prj35.ipynb) · [Công dụng code](danh_sach_code_tieu_luan.md)
- [Dashboard xem lớn](dashboard_prj35.pdf) · [Nhật ký dự án](<nhật ký làm việc.md>)
- [Quy ước D1–D4](QUY_UOC_BAI_TOAN_PRJ35.md) · [Dàn ý](DAN_Y_CHI_TIET_PRJ35.md)
- [Đề giảng viên](<projects (1).pdf>) · [Nguồn đề](projects.qmd)

## Cách chạy phần đã hoàn thành

1. Cài Python và các phiên bản trong `requirements.txt`: `python -m pip install -r requirements.txt`.
2. Mở notebook chính với thư mục làm việc là thư mục chứa notebook (`tieuluan` hoặc thư mục bản sao). Dùng Restart Kernel and Run All. Không chạy từ thư mục cha `mypy`.
3. Hai CSV thô mang tên `26_2521001040_Triệu Hoàng Lan Anh_CSV1.csv` và `26_2521001040_Triệu Hoàng Lan Anh_CSV2.csv` nằm trong `data/nguon_goc/`. Bảng điện sạch bàn giao là `data/power_clean_csv1.csv`. Notebook tái tạo `data/weather_clean_csv2.csv` và `data/merged_minute_float32_B3.parquet`; đây là ba bảng chính. Các bảng trung gian chỉ nằm trong bộ nhớ và output notebook, không xuất CSV. Dashboard được vẽ từ các biến này, ảnh lưu trong `baocao/assets/`.
4. Notebook đối chiếu B1 nằm trong `ho_so_du_lieu/`; chạy với thư mục làm việc là chính `ho_so_du_lieu`. Đường dẫn dữ liệu của B1 là `../data/`. B1 chỉ đối chiếu, không ghi đè điện sạch.
5. Để xuất tài liệu cần Quarto và Times New Roman. Chạy lần lượt `quarto render tieu_luan_prj35.qmd`, `quarto render lo_trinh_thuc_hien_prj35.qmd`, `quarto render dashboard_prj35.qmd` trong thư mục dự án, sau khi notebook chạy xong.

Hai notebook đã chạy từ đầu trong một bản sao đặt ở đường dẫn khác. Bản sao ban đầu chỉ có ba đầu vào trên, không có dữ liệu dẫn xuất. Đây là kiểm chứng phần đã làm, không phải xác nhận toàn bài đã xong hay dữ liệu điện sạch là số đo thực. Bước ghép/B2 còn giữ bảng lớn trong RAM; phép đo chunk không phải RAM đỉnh của chương trình.

## Theo dõi tiến độ

Xem [lộ trình](lo_trinh_thuc_hien_prj35.qmd) để theo dõi bài; trợ lý dùng [ngữ cảnh gọn](AGENTS.md) để tiếp tục công việc. README chỉ giữ hướng dẫn mở và chạy, không duy trì bản sao tiến độ.

## Tiếp thu bản đánh giá

Đã sửa những điểm có căn cứ trong phần đã làm: đường dẫn, thứ tự tái tạo thời tiết trước ghép, kiểm tra lưới thời gian, điền thời tiết từ quá khứ, tối ưu có phép đo, biểu đồ Seaborn, số liệu/insight và tham khảo. Bản nhận xét gốc được giữ nguyên để đối chiếu.

Có các điểm cần hiểu đúng: bỏ riêng bfill vẫn chưa loại nội suy dùng tương lai; không thể biến thời tiết lịch sử thành dự báo bằng đổi tên; không thể phục hồi chắc chắn timestamp hỏng chỉ bằng parse/reindex. UTF-8 trong notebook đọc đúng; hiện tượng mojibake có thể do bộ giải mã terminal. Đề không ấn định 8–10 tài liệu: bổ sung nguồn thực đã dùng, không thêm tài liệu chưa đọc. `chunksize` cần khi vượt RAM, và có giá trị minh họa tối ưu; không khẳng định mọi bước đã dùng streaming. Hình phạt sơ loại trong đề là trừ 50% **hoặc** yêu cầu hoàn thiện lại trong 24 giờ. Điểm trong nhận xét là ước lượng, không phải điểm giảng viên.

## Nhật ký và hồ sơ

`nhật ký làm việc.md` trích các phiên liên quan đã tồn tại, có chú thích nguồn và đính chính rõ nhận định cũ quá mức. Không ghi bù các lượt đã yêu cầu không lưu; không bịa prompt, Mutate & Break, kiểm chứng hoặc đóng góp cá nhân. Nhật ký workspace gốc vẫn giữ lịch sử các môn khác. Nội dung lịch sử không tự cập nhật theo kết quả mới. Từ nay ghi thường xuyên vào nhật ký workspace; bản trích trong dự án chỉ đồng bộ khi được yêu cầu hoặc đóng gói nộp.

Hồ sơ B1/B2 trong `ho_so_du_lieu/`; dữ liệu và bằng chứng kiểm tra trong `data/`; tài nguyên báo cáo trong `baocao/`. Tra chất lượng bằng các CSV tổng hợp nhỏ trước khi mở bảng từng phút. `requirements.txt` là phiên bản thực dùng, không thay thế hướng dẫn Quarto.

## Thư mục không đọc

`LUU_TRU_KHONG_DOC/` giữ tài liệu cũ. Không đọc, tìm kiếm hoặc liệt kê đệ quy thư mục này trừ khi người dùng yêu cầu rõ ràng. Không phát triển các file `.py` cũ; chỉ sửa notebook. Không đồng bộ sang bộ mẫu/lộ trình cũ.


## Phạm vi đọc của trợ lý

Đọc `AGENTS.md` rồi đúng file/đoạn đang xử lý. Không đọc README, nhật ký, đề, dàn ý và quy ước mỗi lượt. Không cập nhật các tài liệu này chỉ để chép lại tiến độ; quy tắc chi tiết nằm trong `AGENTS.md`.
