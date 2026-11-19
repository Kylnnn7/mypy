# B2 — Chất lượng dữ liệu điện theo phương án tái lập

## Phạm vi và ý nghĩa cờ

Nguồn quy tắc: phương án trong `BAO_CAO_HIEU_DU_LIEU_PRJ35.qmd` mục 1.4, đã thử tái lập gần khớp tại B1. Chưa xác nhận mã gốc và căn cứ ngưỡng. B2 không làm sạch lại hay thay đổi dữ liệu.

- `khong_doc_so`: sau bỏ ký tự và đổi dấu phẩy, giá trị vẫn không đọc được thành số; gồm ô trống và chuỗi lỗi.
- `ngoai_nguong`: đọc được thành số nhưng nằm ngoài khoảng của phương án B1; không mặc định là sai vật lý.
- `can_dien`: một trong hai điều kiện trên, tức sẽ cần điền nếu áp dụng phương án B1.
- Giá trị không bị đánh dấu chỉ là đạt quy tắc của phương án, chưa được chứng minh đo đúng. Chuỗi chứa đơn vị lạ có thể được chuyển thành số và không bị đánh dấu.
- Thống kê theo ngày dựa trên nhãn file sạch, chưa xác minh múi giờ gốc hoặc toàn bộ nhãn đã khôi phục.

## Kết quả

Cột công suất tác dụng có 287.240/2.075.259 phút cần điền theo phương án (13,8412%): 196.665 không đọc được thành số sau chuẩn hóa và 90.575 ngoài ngưỡng. Hai nhóm không trùng nhau.

Có 1.442 ngày theo nhãn, trong đó 1.440 ngày đủ 1.440 phút. Ngày đầu 16/12/2006 có 396 phút; ngày cuối 26/11/2010 có 1.263 phút. Tất cả 1.442 ngày có ít nhất một phút bị đánh dấu. Trung vị tỷ lệ theo ngày là 12,7778%; đây là thống kê theo ngày, khác tỷ lệ toàn bộ phút.

Trong các ngày đủ 1.440 phút, có 22 ngày tỷ lệ cần điền từ 20% trở lên, 19 ngày từ 50% trở lên và 9 ngày 100%. Ở B2 các mốc này dùng mô tả; C1 sau đó đã chốt tối đa 20% cho EDA và đối chiếu 15%, không phải xác nhận nhãn chấm mô hình.

Chín ngày cần điền toàn bộ theo phương án: 2007-04-29, 2009-06-14, 2010-01-13, 2010-08-18, 2010-08-19, 2010-08-20, 2010-08-21, 2010-09-26, 2010-09-27.

## Hệ quả đối với dự báo

Phương án dùng nội suy theo thời gian, sau đó điền tiến/lùi. Nội suy khoảng trống bên trong có thể sử dụng giá trị ở phía tương lai; điền lùi ở đầu chuỗi cũng dùng dữ liệu phía sau. Vì vậy, chia train/test về sau không tự loại bỏ thông tin tương lai đã được dùng ở bước làm sạch.

Không coi toàn bộ Y ngày từ file sạch là nhãn đo thực. Đặc biệt, chín ngày bị đánh dấu 100% không có công suất phút nào được giữ lại theo phương án này; không dùng chúng như bằng chứng chấm dự báo trên quan sát thực. Trước mô hình cần xác nhận hồ sơ điện, chốt quy tắc ngày đủ chất lượng và báo tỷ lệ được điền của nhãn. Chưa loại ngày hoặc tính Y trong B2.

## File đầu ra

- `data/chat_luong_cot_dien_B2.csv`: thống kê cả 7 cột số.
- `data/co_chat_luong_cong_suat_B2.csv`: nhãn thời gian và ba cờ của cột mục tiêu ở từng phút; dùng truy vị trí.
- `data/chat_luong_ngay_dien_B2.csv`: tổng số phút, các loại cờ, tỷ lệ theo ngày và cờ đủ 1.440 phút.
- Mã và kết quả nằm ở mục 3.3.5 (B2) trong `../tieu_luan_prj35.ipynb`.

B2 đã hoàn thành đánh giá chất lượng theo phương án tái lập; nguồn gốc mã và độ đúng của ngưỡng vẫn là giới hạn B1. B3 và C1–C4 đã hoàn thành cho EDA; trước mô hình vẫn phải giải quyết nguồn và chất lượng nhãn ngày.
