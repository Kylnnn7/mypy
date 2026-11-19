# C1 — Đề xuất quy tắc chất lượng ngày

Trạng thái: người dùng đã chọn tối đa 20% cần điền cho phân tích thử, so sánh thêm 15%. Đã gắn cờ trong bảng ngày C2; không xóa ngày.

## Căn cứ

B2 có 1.442 ngày theo nhãn, trong đó 1.440 ngày đủ 1.440 phút. Hai ngày biên 16/12/2006 (396 phút) và 26/11/2010 (1.263 phút) không đủ ngày. Không có ngày hoàn toàn không cần điền theo phương án B1; 9 ngày đủ thời lượng bị đánh dấu 100%.

| Ngưỡng tỷ lệ cần điền tối đa | Ngày đủ thời lượng đạt ngưỡng |
|---|---:|
| 0% | 0 |
| 5% | 0 |
| 10% | 1 |
| 15% | 1.400 |
| 20% | 1.418 |
| 50% | 1.421 |
| 100% | 1.440 |

## Quy tắc đã thống nhất

- Giữ mọi dòng ở bảng phút và mọi nhãn ngày ở bảng ngày, gắn cờ chất lượng thay vì xóa dữ liệu.
- Hai ngày biên chỉ ghi giá trị trên phần quan sát; không gọi là điện năng cả ngày hoặc nhân trung bình với 24 để coi như quan sát đầy đủ.
- Với phân tích thử theo ngày: yêu cầu đủ 1.440 phút và tỷ lệ cần điền không quá 20%. So sánh thêm ngưỡng 15% để xem kết quả có phụ thuộc lựa chọn ngưỡng không. Đây là ngưỡng thực nghiệm đã được chọn, không phải chuẩn chất lượng cảm biến.
- Ngày có 100% công suất bị đánh dấu không dùng như nhãn đo thực để chấm dự báo. Không coi các ngày đạt 15%/20% tự động đủ điều kiện làm nhãn đánh giá đáng tin cậy.
- Giữ lịch ngày liên tục khi tạo biến trễ; không lọc ngày rồi shift vì sẽ biến ngày trước thành dòng trước dù có khoảng trống.
- Tổng hợp thời tiết từ bảng giờ gốc, không cộng mưa đã lặp theo phút.

## Giới hạn còn phải giải quyết

Cờ B2 suy ra từ phương án tái lập, chưa phải lịch sử sửa dữ liệu gốc đã xác minh. Ngưỡng theo tỷ lệ ngày không giải quyết việc nội suy dùng thông tin tương lai. Trước mô hình cần xử lý riêng nguồn nhãn, thời điểm thông tin và dữ liệu đã điền; không dùng kết quả chấm trên dữ liệu tái lập như bằng chứng dự báo số đo thực.

Nguồn số liệu: `data/chat_luong_ngay_dien_B2.csv`; bảng so sánh: `data/so_sanh_nguong_chat_luong_C1.csv`; code: phần C1 trong notebook chính.
