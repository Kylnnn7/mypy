# Quy ước bài toán PRJ-35 đã thống nhất

D1–D4 đã được người dùng chấp thuận. Tài liệu này mô tả phương án áp dụng, không phải kết quả mô hình đã chạy.

- **D1:** phát dự báo sau khi kết thúc ngày t, dự báo công suất tác dụng trung bình ngày t+1, đơn vị kW. Báo kèm điện năng ngày (kWh). Ngày đủ 1.440 phút: điện năng = tổng công suất phút / 60 = công suất trung bình ngày × 24. Ngày không đủ và các giá trị được điền cần được đánh dấu; đã chọn đủ 1.440 phút và tối đa 20% cần điền cho phân tích thử, so sánh thêm 15%; chưa xác nhận nhãn chấm mô hình.
- **D2:** OLS và Random Forest Regressor là hai mô hình chính. Dự báo bằng cùng ngày tuần trước là mốc so sánh, không gọi là mô hình học máy được huấn luyện. Đánh giá MAE, RMSE, R² và MAPE khi mục tiêu không bằng/quá gần 0; chưa có kết quả hay mô hình thắng.
- **D3:** lịch và lịch sử điện là đầu vào chính. Thời tiết là nhánh bổ trợ, có điều kiện về múi giờ và khả năng có thông tin ở thời điểm dự báo. Không dùng thời tiết quan sát hoặc các đại lượng điện của chính ngày cần dự báo làm đầu vào.
- **D4:** tiếp tục notebook cơ bản, giữ file Python cũ; bổ sung phần còn thiếu của đề và thống nhất một lộ trình. Đã dùng đường dẫn tương đối cho hai notebook, không phát triển thêm trên file `.py`.

## Câu hỏi nghiên cứu

1. Tiêu thụ điện biến đổi theo giờ, ngày trong tuần và tháng/mùa ra sao? Khi nào mức sử dụng cao/thấp?
2. Cơ cấu điện năng giữa các nhóm thiết bị ra sao? Thời tiết liên hệ thế nào với tiêu thụ trong phạm vi nguồn dữ liệu cho phép?
3. OLS và Random Forest dự báo công suất trung bình ngày kế tiếp tốt hơn mốc cùng ngày tuần trước ở mức nào?

## Quy tắc thực nghiệm

Giữ bảng tổng thể cấp phút 2.075.259 dòng; tạo bảng giờ cho EDA và bảng ngày cho mô hình. Không nhân bản dữ liệu ngày để đạt 100.000 dòng. Không cộng lượng mưa bị lặp theo phút.

Đặc trưng ban đầu dự kiến: trễ 1/7 ngày, trung bình 7 ngày trước, thứ và tháng của ngày dự báo. Chỉ dùng lịch sử đã biết. Giữ 20% ngày cuối làm test; 80% đầu làm phần phát triển, lấy đoạn cuối của phần này để chọn cấu hình. Chốt ranh giới ngày sau khi tạo bảng ngày và kiểm tra chất lượng. Đánh giá từng ngày với lịch sử cập nhật, không diễn giải thành dự báo cả đoạn test từ một thời điểm.

Chỉ học phép tiền xử lý từ tập huấn luyện. Pipeline không tự sửa rò rỉ đã xảy ra trong dữ liệu được làm sạch từ trước. Cần hồ sơ xử lý điện trước khi coi nhãn dự báo là quan sát đo thực.

## File làm việc

- Bản chính: notebook, báo cáo và lộ trình tại gốc `tieuluan`.
- Không còn đồng bộ bản trùng. Hồ sơ B1/B2 ở `ho_so_du_lieu/`; dữ liệu ở `data/`; tài nguyên báo cáo ở `baocao/`.
- `lo_trinh_thuc_hien_prj35.qmd`: lộ trình duy nhất đang áp dụng.
- Tài liệu cũ và bản trùng đã chuyển vào `LUU_TRU_KHONG_DOC/`. Chỉ đọc khi người dùng yêu cầu rõ ràng.

## Phần chưa hoàn thành

Hồ sơ/mã làm sạch điện gốc đầy đủ; đặc trưng, mô hình, kết quả đánh giá; Chương 2 và 5. Không đánh dấu các phần này là đã thực hiện.

B3 tối ưu RAM và lưu Parquet đã hoàn thành. C1 đã chốt ngưỡng 20% và đối chiếu 15% cho phân tích thử; C2 đã tạo bảng điện ngày và gắn cờ, giữ đủ 1.442 ngày, xem `ho_so_du_lieu/DE_XUAT_CHAT_LUONG_NGAY_C1.md`.

C3 đã tạo bảng điện theo giờ, giữ 34.589 giờ và tỷ lệ cần điền; hai giờ biên để thiếu điện năng cả giờ. Ngưỡng 20%/15% đã chốt cho ngày không tự áp dụng cho giờ.

C4 đã tổng hợp thời tiết ngày từ file giờ gốc và ghép với điện giờ/ngày. Dùng các bảng C4 cho phân tích bổ trợ; không dùng thời tiết tương lai làm đầu vào dự báo. D1 đã có thống kê ngày và đối chiếu 20%/15%; D2 đã có thống kê giờ/thứ/tháng, D3 đã có cơ cấu tính toán có điều kiện và kiểm tra chênh lệch âm; D4 đã có Pearson mô tả bổ trợ theo nhãn ngày; D5 đã tổng hợp phát hiện, mục 3.5 đã có dashboard/heatmap/boxplot; tiếp theo vẫn ưu tiên nguồn nhãn trước kiểm định và mô hình. Người dùng đã học Matplotlib cơ bản và đồng ý dùng.


Ngày 14/11/2026: theo yêu cầu người dùng, ưu tiên rubric và khung chính thức. Hai dashboard 300 DPI đã bổ sung; lộ trình duy nhất ánh xạ 1.1–5.4. Thứ tự tiếp theo chuyển sang khép vấn đề nguồn nhãn và nội suy dùng tương lai trước kiểm định/mô hình. Các dòng “bước tiếp theo” trước đây là lịch sử, ưu tiên mục cuối trong lộ trình.


## Quy tắc thời tiết và tái lập hiện hành

Hàm thời tiết được gọi trước ghép, giữ mốc thô đọc được và kiểm tra với lưới giờ trước khi điền mốc không đọc được. Lưu cờ tại co_chat_luong_thoi_tiet.csv. Bốn biến liên tục dùng ffill, không nội suy hai phía/bfill; đầu chuỗi thiếu vẫn giữ NaN. Mưa thiếu bằng 0 vẫn là giả định. Cờ đủ thời tiết kiểm tra đủ 24 giá trị ở cả năm biến: 1.441/1.442 ngày, nhóm điện đủ chất lượng vẫn có 1.418/1.400 ngày. Chưa xác nhận mốc suy ra hoặc thời điểm sẵn có ngoài thực tế.

Các đầu ra và hệ số thời tiết đã được tính lại theo quy tắc này; không dùng các hệ số cũ trong nhật ký thay số liệu hiện hành. Hai notebook chạy được tại bản sao thư mục khác với điện sạch bàn giao. Không diễn giải phép chạy này thành xác nhận làm sạch điện từ raw hoặc đủ điều kiện chấm mô hình.


## Trọng tâm trình bày Chương 3

Theo yêu cầu hiện hành, tập trung các mục 3.1–3.6 của khung, ưu tiên kết quả xử lý và EDA. Kiểm tra kỹ thuật lưu trong code/hồ sơ, không kéo dài thành chuỗi đối chiếu trong báo cáo. Bước tiếp theo là thiết kế kiểm định 3.6; nguồn nhãn và dữ liệu điền vẫn là điều kiện phải giải quyết trước đánh giá mô hình. Quy tắc này thay các ghi chú “bước tiếp theo” cũ trong tài liệu.

Ngày 15/11/2026: đã thực hiện 3.6 bằng HAC trên lịch tuần liên tục, t-test ghép cặp tham khảo; chỉ suy luận khám phá trên tuần được chọn. Thứ tự hiện hành: viết cơ sở phương pháp đã dùng ở 2.4, rồi chốt nhãn trước Chương 4. Ghi chú này thay các bước tiếp theo cũ.
