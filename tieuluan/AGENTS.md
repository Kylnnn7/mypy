# PRJ-35 — ngữ cảnh làm việc duy nhất cho trợ lý

## Đọc và cập nhật tối thiểu

- Khi tiếp tục bài, chỉ đọc file này nếu chưa có nội dung trong ngữ cảnh, rồi mở đúng phần của file cần sửa. Không đọc lại tài liệu đã có trong cùng phiên.
- Không mặc định đọc README, nhật ký, dàn ý, quy ước, đề, toàn bộ notebook hoặc toàn bộ lộ trình. Chỉ tra mục liên quan khi nhiệm vụ cần, có mâu thuẫn hoặc thiếu căn cứ. Không quét workspace.
- File này là bản tóm tắt để tiếp tục công việc, không thay đề giảng viên hoặc lộ trình chi tiết. Nếu bằng chứng mới khác bản tóm tắt, xác minh đúng chỗ rồi sửa bản tóm tắt.
- Chỉ sửa file trực tiếp tạo ra kết quả của nhiệm vụ. Cập nhật mục “Điểm tiếp tục” dưới đây khi hoàn thành bước hoặc đổi quyết định quan trọng; thay nội dung cũ, không nối lịch sử dài.
- Theo yêu cầu mới: không cập nhật file lộ trình nữa, chỉ sửa khi người dùng yêu cầu lại. Chỉ xuất lại PDF có nguồn thay đổi. Không đồng bộ trạng thái sang README, dàn ý và quy ước mỗi lượt; chúng chỉ đổi khi nội dung riêng thật sự đổi.
- Không mở, tìm kiếm, liệt kê đệ quy hoặc dùng `LUU_TRU_KHONG_DOC/` trừ khi người dùng yêu cầu rõ ràng. Không đọc/cập nhật .py cũ.

## Quy tắc cố định

- Ưu tiên đề PRJ-35 và barem; làm từng bước nhỏ, không tự chuyển sang nhiều bước. Không bịa kết quả, đóng góp cá nhân hoặc cam kết điểm.
- Người học biết NumPy, Pandas, Matplotlib cơ bản. Đã đồng ý được giải thích và dùng chunksize, category, Seaborn, OLS, MAE/RMSE, t-test, HAC, rolling, StandardScaler/OneHotEncoder/Pipeline (ColumnTransformer đi kèm); không mặc định đã thành thạo. Với kỹ thuật mới khác, hỏi đã học chưa và giải thích ngắn trước khi áp dụng.
- Notebook chỉ có tiêu đề ngắn, code cơ bản và kết quả; mỗi cell một việc. Diễn giải/kết luận ở báo cáo. Tránh cấu hình đường dẫn, try/except và lớp trừu tượng không cần thiết.
- Code mới có cú pháp chưa liệt kê thì thêm công dụng vào danh sách code, không thêm ví dụ. Không cập nhật .py.
- Chỉ chạy lại phần bị ảnh hưởng; kiểm thử toàn luồng khi thay luồng hoặc nghiệm thu. Không lặp đối chiếu cũ nếu không có lỗi/thay đổi mới. CSV lớn chỉ đọc cột cần dùng cho tính toán.
- Hạn hoàn thành: 30/11/2026 theo “cuối tháng” của người dùng; giờ đóng cổng chưa xác nhận.

## Điểm tiếp tục — cập nhật 16/11/2026

- Dữ liệu hiện hành: chỉ ba tệp tại `data/`: `power_clean_csv1.csv`, `weather_clean_csv2.csv`, `merged_minute_float32_B3.parquet` (2.075.259 dòng). Hai CSV thô cần tái lập ở `data/nguon_goc/`. Không tạo lại CSV trung gian hoặc bản CSV trùng bảng ghép. Bảng giờ/ngày, đặc trưng, kiểm định, metrics là biến trong notebook. Các bảng phục vụ biểu đồ được xuất riêng vào `dashboard_csv/`; dashboard HTML dùng các CSV này, ảnh đưa vào PDF. File trung gian cũ đã chuyển vào lưu trữ, không đọc mặc định.
- Chương 3–4 đã viết đến 4.6; tiếp theo 5.1, Chương 2 vẫn để sau. Không cập nhật lộ trình. Không cập nhật .py.
- Chương 4 đọc bảng ghép, 7 biến gồm 3 lịch sử điện + 2 nhiệt độ quá khứ + thứ/tháng. Train/val/test 331/68/66. OLS/RF 22/24 cột sau mã hóa. Mưa ngày tổng hợp mỗi giờ một lần.
- Test MAE baseline/OLS/RF khoảng 0,179496/0,155044/0,169804 kW. RF MAE thấp nhất validation; test đã được tái sử dụng sau sửa đặc trưng, không gọi test độc lập mới.
- Đã bỏ t-test sai số có dấu: dùng HAC trên chênh sai số tuyệt đối, trễ ngày 7/14/28, p hiệu chỉnh 3 cặp; chưa đủ bằng chứng khác biệt 5%. RF tốt nhất cả 3 cửa sổ trước test; permutation validation bổ trợ vai trò lịch sử điện. Không dùng chẩn đoán để tự tối ưu lại test.
- Notebook 71 cell code đã chạy trọn trong kernel mới sau khi dọn IO; xác nhận không tái tạo CSV trung gian và giữ kết quả dự báo. Nguồn các bảng trong báo cáo trỏ tên biến notebook, không trỏ CSV trung gian.

## Định vị theo nhiệm vụ — chỉ mở khi cần

| Việc | File |
|---|---|
| Code chính, chạy tại thư mục tieuluan | `tieu_luan_prj35.ipynb` |
| Bài viết / bản đọc | `tieu_luan_prj35.qmd` / `.pdf` |
| Lộ trình chi tiết duy nhất | `lo_trinh_thuc_hien_prj35.qmd` / `.pdf` |
| Công dụng cú pháp | `danh_sach_code_tieu_luan.md` |
| Đề và barem | `projects.qmd`, bản gốc `projects (1).pdf` |
| Khung chi tiết / quyết định đề tài | `DAN_Y_CHI_TIET_PRJ35.md` / `QUY_UOC_BAI_TOAN_PRJ35.md` |
| Kết quả và đầu vào | `data/` ba bảng chính; kết quả nhỏ xem output notebook |
| Cặp tuần / kết quả HAC | Biến `cap_tuan_36`, `hac_36` trong notebook |
| Dashboard / hình / tài liệu tham khảo | `dashboard_prj35.qmd`, `baocao/assets/`, `baocao/references.bib` |
| Cài đặt và chạy | `README.md`, `requirements.txt` |
| Truy lỗi dữ liệu khi cần | `ho_so_du_lieu/CHI_TIET_KIEM_TRA_CHUONG3.md`, notebook B1 trong cùng thư mục |

## Nhật ký — một nơi ghi thường xuyên

- Ghi bước chuyên môn thật vào `C:/mypy/00_nhật ký làm việc.md` theo skill nhật ký, chỉ chèn mục mới; không đọc lại toàn bộ để ghi. Không lưu thao tác quản lý file, cập nhật danh sách code hoặc lượt người dùng nói không lưu.
- Với PRJ-35, dùng mục “Điểm tiếp tục” thay việc bắt buộc đọc lại 3–5 phiên nhật ký mỗi lượt. Chỉ tra nhật ký khi khôi phục thông tin thiếu, xác minh lịch sử hoặc người dùng yêu cầu.
- `nhật ký làm việc.md` trong dự án là bản trích phục vụ nộp: giữ lịch sử hiện có, chỉ đồng bộ khi người dùng yêu cầu hoặc đóng gói bài nộp; không ghi song song mỗi lượt. Không thêm phiên giả hoặc sửa lịch sử thành kết quả mới.
- README/dàn ý/quy ước có thể chứa ghi chú tiến độ cũ; không dùng các dòng đó để chọn bước tiếp theo. Theo mục “Điểm tiếp tục” và lộ trình hiện hành.
