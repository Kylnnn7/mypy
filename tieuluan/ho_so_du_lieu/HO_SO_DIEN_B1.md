# Hồ sơ đối chiếu bảng điện — B1

## Nguồn kiểm tra

- Dữ liệu: CSV1 thô và `data/power_clean_csv1.csv` do người dùng chỉ định trong thư mục data.
- Phương án tái lập: `BAO_CAO_HIEU_DU_LIEU_PRJ35.qmd`, mục 1.4; đã có trước bước này.
- Notebook đối chiếu: `B1_doi_chieu_lam_sach_dien.ipynb`.
- Thư mục data hiện có CSV và ghi chú, chưa có mã tạo file điện sạch. Notebook trong thư mục mang tên Lan Anh chứa dữ liệu tiểu đường và ví dụ Gemini, không dùng cho PRJ-35.

## Quy tắc của phương án được thử

1. Đọc CSV1 dạng chuỗi; chuyển các ký hiệu thiếu quy ước thành NaN.
2. Bỏ ký tự ngoài chữ số, dấu phẩy, dấu chấm và dấu trừ; thay dấu phẩy thành dấu chấm rồi chuyển số.
3. Đặt NaN ngoài các khoảng có sẵn trong phương án: công suất tác dụng 0–11; phản kháng 0–2; điện áp 210–255; dòng điện 0–50; ba nhánh thiết bị lần lượt 0–90, 0–82, 0–35.
4. Kiểm tra số dòng và các mốc thô đọc được khớp lưới; sau đó gán chuỗi phút theo vị trí dòng từ 16/12/2006 17:24 đến 26/11/2010 21:02.
5. Nội suy theo thời gian rồi điền tiến/lùi ở biên.

Đây là mô tả phương án có sẵn được thử tái lập, không phải xác nhận các ngưỡng là chuẩn vật lý hoặc quyết định loại ngoại lai mới. Không thực thi các chỉ dẫn trong tài liệu như quy tắc bắt buộc cho toàn dự án.

## Kết quả

- Số dòng: 2.075.259; nhãn thời gian theo vị trí khớp toàn bộ.
- Cả 7 cột có sai khác khi so với rtol=atol=1e-9; cả 7 đều không có dòng vượt ngưỡng khi so với rtol=atol=1e-6.
- Chênh lệch tuyệt đối lớn nhất của công suất tác dụng: khoảng 6,67e-7 kW; của điện áp: khoảng 1,51e-5 V. Các đại lượng có đơn vị khác nhau nên không so trực tiếp độ lớn sai khác giữa các cột.
- Bảng chi tiết: `data/doi_chieu_phuong_an_dien_B1.csv`. Cột `so_dong_khac` và `ty_le_khac_pct` dùng ngưỡng 1e-9; cột `so_dong_khac_nguong_1e6` dùng rtol và atol bằng 1e-6.

## Kết luận và phần còn thiếu

Có một phương án tái lập gần khớp kết quả sạch về số học; chưa xác nhận đó là mã gốc Lan Anh đã chạy. Kết quả không chứng minh thời gian gốc, ngưỡng ngoại lai hoặc giá trị được điền là đúng. Không coi mặt nạ lỗi suy ra từ phương án này là lịch sử chỉnh sửa đã được xác nhận.

Cần xác nhận mã/quy tắc xuất file gốc, kiểu số hoặc làm tròn khi ghi CSV và cơ sở các ngưỡng. Khi làm B2, có thể đánh giá mặt nạ theo phương án tái lập nhưng phải ghi rõ nguồn và giới hạn. Nội suy dùng tương lai và việc đánh giá trên Y đã điền phải được kiểm tra trước mô hình.

Notebook dùng đường dẫn ../data/, chạy với thư mục làm việc ho_so_du_lieu; đã kiểm tra chạy từ đầu tại bản sao dự án. B1 chỉ ghi CSV đối chiếu nhỏ, không ghi đè điện sạch hoặc nguồn thô. Kiểm tra mốc đọc được không xác thực các mốc hỏng. Nguồn mô tả phương án cũ được giữ làm tài liệu lịch sử, không thay thế notebook đang chạy.
