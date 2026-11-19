# Hồ sơ kỹ thuật kiểm tra Chương 3

Chi tiết tách từ báo cáo để tra cứu khi cần giải thích mã hoặc kiểm tra kết quả. Không phải lộ trình hay nội dung chính của Chương 3. Số mục dưới đây là số trước khi rút gọn; số mục hiện hành xem báo cáo. Các nguồn trích dẫn có trong ../baocao/references.bib.

## 3.2. Quy trình ghép nối bảng dữ liệu và tối ưu bộ nhớ

Phần tích hợp được gộp thành ba bước: xác định vấn đề; đồng bộ khóa và ghép; đối chiếu kết quả. Điện sạch bàn giao được dùng lại; thời tiết sạch được tái tạo trước ghép bằng hàm ở phần chuẩn bị. Các mục 3.2.4–3.2.7 trình bày đo RAM, hạ kiểu, Parquet và đọc theo phần/category.

### 3.2.1. Xác định vấn đề: ở đâu và bao nhiêu dòng?

Notebook đối chiếu thời gian thô với thời gian sạch tại cùng vị trí dòng. Điện được đọc theo định dạng ngày/tháng/năm và giờ:phút:giây; thời tiết được đọc theo năm-tháng-ngày, ký tự T và giờ:phút. Giá trị thiếu hoặc không đọc được theo định dạng được đánh dấu; giá trị đọc được nhưng khác nhãn trong file sạch được tính là lệch.

| Nội dung kiểm tra | Điện | Thời tiết |
|---|---:|---:|
| Số dòng | 2.075.259 | 34.608 |
| Thời gian thô thiếu/không đọc được | 757.566 | 7.680 |
| Thời gian thô đọc được nhưng lệch file sạch | 0 | 0 |
| Thời gian thiếu trong file sạch | 0 | 0 |
| Thời gian trùng trong file sạch | 0 | 0 |
| Tổng ô thiếu trong file sạch | 0 | 1 |

: Đối chiếu thời gian trước ghép {#tbl-truoc-ghep}

*Nguồn: phần kiểm tra, đồng bộ và đối chiếu trong notebook PRJ-35 đã chạy.*

Danh sách vị trí được lưu trong `kiem_tra_thoi_gian_csv1.csv` và `kiem_tra_thoi_gian_csv2.csv`. Các file ghi số dòng của CSV thô, giá trị thô, giá trị sạch và cờ loại vấn đề. Số dòng tính từ đầu tệp, bắt đầu bằng 1 và có tính các dòng metadata/tiêu đề. Notebook chỉ hiển thị 10 trường hợp đầu để dễ đọc.

Phép kiểm tra không sửa các CSV thô; bảng thời tiết sạch dẫn xuất được tái tạo có cờ theo quy tắc 3.3.2. Nhãn thô đọc được khớp file sạch không xác thực được toàn bộ các mốc gốc đã mất.

### 3.2.2. Đồng bộ khóa giờ và ghép hai bảng

Notebook dùng `.dt.floor('h')` tạo khóa đầu giờ, rồi ghép trái bằng `pd.merge()` với kiểm tra quan hệ nhiều-một. Mỗi dòng điện được giữ lại và nhận năm biến thời tiết của cùng khóa giờ. Cột thời gian thời tiết được đổi tên thành `weather_datetime` để phân biệt với `datetime` của bảng điện.

**Giả định đang dùng:** hai nhãn ngày/giờ giống nhau được coi là cùng khung giờ. Đây là sự thống nhất cách biểu diễn khóa, chưa phải bằng chứng rằng hai nguồn cùng thời điểm tuyệt đối. UTC là giờ phối hợp quốc tế; UTC+2 nhanh hơn UTC hai giờ. Tệp thời tiết có độ lệch UTC+2 cố định, còn thông tin nguồn điện đã đối chiếu chưa xác nhận múi giờ của các mốc điện [@uci; @openmeteo].

Do đó, mã giữ nguyên nhãn giờ, không tự dịch giờ. Bảng được đặt tên `merged_minute_theo_nhan_gio.csv` để thể hiện giả định. Việc tất cả khóa đều khớp không đồng nghĩa đã xác nhận đồng bộ UTC.

### 3.2.3. Đối chiếu sau ghép và lưu kết quả

| Chỉ tiêu | Kết quả |
|---|---:|
| Số dòng điện trước ghép | 2.075.259 |
| Số dòng sau ghép | 2.075.259 |
| Số cột sau khi bỏ cột chỉ báo ghép | 15 |
| Dòng không có thời tiết tương ứng | 0 |
| Thời gian điện bị trùng | 0 |
| Ô thời tiết bị thiếu | 0 |
| Dòng thời tiết khác khung giờ điện | 0 |
| Các giá trị điện giữ nguyên | Có |

: Kết quả kiểm tra kỹ thuật sau ghép {#tbl-sau-ghep}

*Nguồn: kết quả đối chiếu đã lưu trong notebook PRJ-35.*

Notebook kiểm tra số dòng, mức khớp khóa, tính duy nhất của thời gian điện và sự bằng nhau của các cột điện trước/sau ghép. Sau kiểm tra, cột chỉ báo ghép được bỏ rồi lưu CSV. File `GHI_CHU_BANG_GHEP.md` đi kèm mô tả giới hạn sử dụng.

Không cộng lượng mưa bị lặp trên các dòng phút để tính tổng mưa theo giờ. Kết quả kiểm tra xác nhận phép ghép đúng với quy tắc khóa đã chọn; giả định về sự tương ứng của hai nhãn giờ vẫn cần được xét khi diễn giải quan hệ điện - thời tiết.

### 3.2.4. Đo bộ nhớ bảng ghép trước tối ưu

Bảng ghép theo nhãn giờ được đọc lại từ CSV, chuyển ba cột datetime, hour_key và weather_datetime sang kiểu ngày giờ ngay khi đọc. Bảng gồm 2.075.259 dòng và 15 cột: 12 cột float64 và 3 cột datetime64[us] trong môi trường chạy hiện tại.

Dùng `memory_usage(deep=True)` để đo bộ nhớ từng cột và chỉ mục. Kết quả tổng cộng 249.031.212 byte, tương đương 237,49 MiB (1 MiB = 1.048.576 byte). Mỗi cột chiếm khoảng 15,83 MiB; chỉ mục dòng chiếm 132 byte. Đây là bộ nhớ của DataFrame sau khi nạp và chuyển kiểu thời gian, không phải dung lượng CSV, mức RAM cao nhất lúc đọc file hoặc toàn bộ bộ nhớ của Python.

Kết quả chi tiết lưu trong bo_nho_bang_ghep_B3.csv. Đây là mốc RAM trước hạ kiểu; kết quả tiết kiệm và Parquet được trình bày ở hai mục tiếp theo.


### 3.2.5. Thử hạ kiểu số và đối chiếu sai số

Trên bản sao của bảng ghép, nhóm chuyển 12 cột float64 sang float32, giữ nguyên ba cột thời gian. Số dòng, số cột, chỉ mục, vị trí ô thiếu và ba cột thời gian được đối chiếu và không thay đổi.

| Phiên bản | Bộ nhớ (byte) | Bộ nhớ (MiB) |
|---|---:|---:|
| float64 | 249.031.212 | 237,49 |
| float32 | 149.418.780 | 142,50 |

: Bộ nhớ bảng ghép trước và sau thử hạ kiểu {#tbl-ram-b3}

Bộ nhớ riêng của bảng giảm khoảng 95,00 MiB, tương đương 40%. Khi giữ cả bản gốc và bản sao để đối chiếu, tổng bộ nhớ tiến trình không giảm tương ứng; phép đo này không đo bộ nhớ đỉnh hoặc thời gian xử lý.

Sai số được tính sau khi đưa giá trị float32 trở lại float64 để trừ với bản gốc; phép chuyển ngược không khôi phục độ chính xác đã mất. Sai số tuyệt đối lớn nhất của công suất tác dụng là 4,730225e-7 kW; điện áp là 7,617187e-6 V. Sai số tương đối lớn nhất trong 12 cột khoảng 5,91e-8, tính trên các giá trị gốc khác 0. Các giá trị 0 vẫn được kiểm tra bằng sai số tuyệt đối.

Dùng điều kiện số học |mới - gốc| ≤ 1e-8 + 1e-6 × |gốc|, không có giá trị vượt dung sai ở cả 12 cột. Đây là dung sai thử đối chiếu làm tròn, không phải tiêu chuẩn sai số thiết bị hoặc bằng chứng mô hình không bị ảnh hưởng. Kết quả ủng hộ dùng float32 cho bản dẫn xuất tiết kiệm bộ nhớ; giữ bản float64 làm đối chứng và kiểm tra lại độ chính xác khi tổng hợp hoặc mô hình hóa.

Chi tiết lưu trong sai_so_float32_B3.csv và so_sanh_bo_nho_B3.csv. Cả 12 cột đều được kiểm tra không có giá trị vượt dung sai; bản float32 được lưu ở mục tiếp theo, không thay file điện sạch đầu vào.


### 3.2.6. Lưu Parquet và kiểm tra đọc lại

Bản dẫn xuất gồm 12 cột float32 và ba cột ngày giờ được lưu bằng Pandas với engine PyArrow, nén Snappy và không ghi chỉ mục dòng. Môi trường thực hiện dùng Pandas 3.0.5 và PyArrow 26.0.1. File kết quả là merged_minute_float32_B3.parquet; CSV gốc vẫn được giữ để đối chứng.

Sau khi đọc lại, bảng có 2.075.259 dòng và 15 cột. Kiểm tra số dòng/cột, tên và thứ tự cột, kiểu dữ liệu, chỉ mục và toàn bộ giá trị đều khớp bản float32 trước khi lưu. Kiểm tra này yêu cầu bằng nhau hoàn toàn, không dùng dung sai; bước ghi/đọc Parquet không tạo thêm sai lệch so với bản float32. Sai số do hạ kiểu ở mục trước vẫn tồn tại so với CSV float64.

| File | Dung lượng (byte) | Dung lượng (MiB) |
|---|---:|---:|
| CSV float64 | 247.467.152 | 236,00 |
| Parquet float32, Snappy | 28.346.111 | 27,03 |

: Dung lượng lưu trữ CSV và Parquet {#tbl-parquet-b3}

Dung lượng file giảm khoảng 88,55% trong lần thử này. Đây là hiệu quả kết hợp của kiểu số, định dạng và nén, không tách riêng tác động của từng yếu tố. Bảng đọc lại chiếm 142,50 MiB trong RAM; dung lượng file nén không đại diện cho bộ nhớ khi xử lý. Chưa đo tốc độ đọc/ghi, do đó không kết luận mức tăng tốc.

Bảng kiểm tra lưu trong kiem_tra_parquet_B3.csv; kích thước trên đĩa được đo trực tiếp trong notebook và lưu trong dung_luong_luu_tru_B3.csv. Kích thước trên là của bảng thời tiết điền từ quá khứ ở 3.3.2. Kiểm tra ghi/đọc Parquet khớp toàn bộ giá trị không đồng nghĩa dữ liệu đo đã được xác thực.



### 3.2.7. Đọc theo phần và kiểu danh mục

Tệp điện thô được đọc từng phần 100.000 dòng để đếm số dòng, ô thiếu và chuỗi lỗi; không nối các phần thành một bảng lớn. Tổng cộng 2.075.259 dòng; bộ nhớ bảng của phần lớn nhất là 12.042.810 byte (11,49 MiB). Chỉ số này không phải RAM đỉnh của tiến trình: các bước ghép và B2 vẫn đọc các cột cần thiết vào bộ nhớ. `chunksize` cho phép xử lý lần lượt các phần dữ liệu [@pandasread].

Trên 2.075.259 nhãn lịch, cột thứ giảm từ 8.301.036 xuống 2.075.287 byte và cột tháng xuống 2.075.307 byte khi đổi từ int32 sang category, tương đương gần 75% mỗi cột (không gồm chỉ mục). Đây là phép đo riêng, không cộng vào mức giảm 40% của bảng ghép. Kiểu category cũng được dùng cho hai cột lịch trong thống kê D2. Không áp dụng cho số đo liên tục; hiệu quả phụ thuộc số nhãn khác nhau [@pandascategory]. Minh chứng: doc_chunk_3_1.csv và bo_nho_category_3_2.csv.

## 3.3. Quy trình làm sạch và xử lý dữ liệu khuyết, ngoại lai

Phần này trình bày lại các kết quả đã có. Về thứ tự thực thi, làm sạch diễn ra trước ghép; thứ tự mục 3.2 rồi 3.3 được giữ theo khung đề bài và mẫu tham khảo.

### 3.3.1. Kiểm tra dữ liệu thô

CSV1 có ô thiếu, chuỗi ký tự lẫn vào cột số, dấu phẩy, đơn vị như USD hoặc kg, và các giá trị cần xem xét như số âm hoặc 9999. Notebook dùng chuyển đổi số và lọc giá trị để phát hiện các trường hợp này. Không đủ căn cứ để khẳng định 9999 chắc chắn là mã lỗi cảm biến, hoặc mọi số âm đều sai trong mọi cột.

| Biến điện | Số ô thiếu trực tiếp | Tỷ lệ (%) |
|---|---:|---:|
| Date | 353.031 | 17,01 |
| Time | 247.603 | 11,93 |
| Global_​active_​power | 115.810 | 5,58 |
| Global_​reactive_​power | 69.868 | 3,37 |
| Voltage | 275.780 | 13,29 |
| Global_​intensity | 119.337 | 5,75 |
| Sub_​metering_​1 | 361.064 | 17,40 |
| Sub_​metering_​2 | 211.083 | 10,17 |
| Sub_​metering_​3 | 282.851 | 13,63 |

: Ô thiếu trực tiếp của dữ liệu điện thô {#tbl-thieu-dien}

*Nguồn: kết quả kiểm tra ban đầu đã ghi trong báo cáo và notebook. Đây là số ô được nhận diện là thiếu ở lần đọc ban đầu, chưa bao gồm mọi chuỗi không đổi được sang số.*

CSV2 có hai dòng metadata trước tiêu đề quan sát. Hàm sẵn có trong notebook dò dòng chứa tên cột thời gian để xác định số dòng bỏ qua. Kết quả tại tệp đang dùng là hai dòng. Các cột số còn chứa chuỗi như “chưa rõ”, “unknown”, dấu hỏi và dấu gạch ngang.

| Biến thời tiết | Số ô thiếu trực tiếp | Tỷ lệ (%) |
|---|---:|---:|
| time | 3.898 | 11,26 |
| apparent_​temperature | 1.858 | 5,37 |
| RELATIVE_​HUMIDITY_​2M | 2.004 | 5,79 |
| dew_​point_​2m | 3.187 | 9,21 |
| wind_​speed_​10m | 4.043 | 11,68 |
| precipitation | 3.123 | 9,02 |

: Ô thiếu trực tiếp của dữ liệu thời tiết thô {#tbl-thieu-thoi-tiet}

*Nguồn: kết quả kiểm tra ban đầu đã ghi trong báo cáo và notebook.*

Trên các giá trị thời tiết đọc được thành số, phạm vi đã ghi nhận gồm nhiệt độ cảm nhận từ -15,0 đến 35,4 °C; điểm sương từ -14,3 đến 21,5 °C; độ ẩm từ 23 đến 100%; gió từ 0 đến 51,7 km/h; mưa từ 0 đến 7,2 mm. Việc nằm trong giới hạn kiểm tra không chứng minh tất cả giá trị đều chính xác hoặc cảm biến không có lỗi.

### 3.3.2. Làm sạch bảng thời tiết

Quy trình được đóng gói thành hàm lam_sach_thoi_tiet trong phần chuẩn bị notebook, gọi trước phép ghép 3.2. Mục này kiểm tra lại kết quả đó, không tạo một phiên bản sạch khác sau khi đã ghép. Tệp điện sạch hiện có vẫn là đầu vào được bàn giao.

**Chuẩn hóa cột.** Tên thời gian sau xử lý là `datetime`. Năm cột số sau chuẩn hóa lần lượt là `apparent_temperature_c`, `relative_humidity_pct`, `dew_point_c`, `wind_speed_kmh` và `precipitation_mm`.

**Đối chiếu nhãn thời gian.** Phân tích cột time thật bằng định dạng năm-tháng-ngày và giờ-phút. Giữ 26.928 mốc đọc được; kiểm tra tất cả khớp lưới giờ dự kiến và tổng đúng 34.608 dòng trước khi suy ra 7.680 mốc không đọc được. Nếu số dòng hoặc một mốc đọc được lệch lưới, mã dừng. Cờ gio_suy_ra và cờ ô thiếu trước điền được lưu trong co_chat_luong_thoi_tiet.csv. Việc kiểm tra không chứng minh thứ tự/thời điểm thật của các dòng có mốc hỏng; không tự reindex các mốc NaT vì sẽ làm mất liên kết với giá trị cùng dòng.

**Chuyển sang số.** `pd.to_numeric()` với xử lý lỗi thành giá trị thiếu được áp dụng cho năm cột khí tượng. Các chuỗi không chuyển được trở thành NaN để xử lý tập trung.

**Điền thiếu.** Bốn biến liên tục dùng ffill: ô thiếu lấy giá trị hợp lệ gần nhất ở phía trước [@pandasffill]. Không dùng nội suy hai phía hoặc bfill. Nhiệt độ cảm nhận tại 00:00 ngày 16/12/2006 chưa có giá trị trước đó nên giữ NaN; không đưa giá trị tương lai về đầu chuỗi. Mưa thiếu vẫn điền 0 theo giả định, không phải xác nhận không mưa. Ffill tránh nhìn về phía sau nhưng có thể giữ giá trị cũ quá lâu; các cờ trước điền được giữ để đánh giá độ tin cậy. Dữ liệu này vẫn là thời tiết lịch sử, không phải bản dự báo biết trước.

**Chặn biên.** Độ ẩm được giới hạn trong khoảng 0-100%; gió và mưa được chặn cận dưới bằng 0. Các bước này giữ nguyên như mã đã có.

| Chỉ tiêu | Trước xử lý | Sau xử lý |
|---|---|---|
| Số dòng quan sát | 34.608 | 34.608 |
| Số cột | 6 | 6 |
| Tên cột | Có đơn vị và khoảng trắng | Tên thống nhất |
| Kiểu trong bộ nhớ | Các cột chuỗi | Thời gian và năm cột số |
| Ô thiếu trực tiếp | 18.113 | 1 |

: Đối chiếu kết quả làm sạch thời tiết {#tbl-lam-sach}

*Nguồn: kết quả làm sạch thời tiết đã lưu trong notebook. Kiểu thời gian là kiểu trong bộ nhớ khi xử lý; khi đọc lại CSV, cần chuyển cột thời gian về kiểu ngày giờ.*

Kết quả lưu tại weather_clean_csv2.csv. Một ô thiếu ở đầu chuỗi nằm trước mốc điện đầu tiên 17:24 cùng ngày, nên bảng ghép phút không thiếu thời tiết. Có 1.442 ngày đủ nhãn giờ nhưng chỉ 1.441 ngày đủ 24 giá trị ở cả năm biến. Cờ du_24_gio_thoi_tiet kiểm tra số giá trị thực có sau xử lý, không chỉ đếm nhãn giờ.

### 3.3.3. Phạm vi đã hoàn thành và tài liệu mã nguồn

Notebook hiện có phần kiểm tra cả hai bảng, phần làm sạch thời tiết và phần ghép hai file sạch. File điện sạch được sử dụng lại; tài liệu bối cảnh ghi nhận Lan Anh phụ trách phần này. Notebook hiện chưa chứa đầy đủ mã tạo file điện sạch từ CSV1 thô, quy tắc điền và mặt nạ giá trị được thay thế. Vì vậy, báo cáo không bổ sung một quy trình làm sạch điện mới hoặc coi phần mã đó đã hoàn chỉnh.

Phần đã làm gồm kiểm tra/làm sạch có điều kiện, ghép và tối ưu, tổng hợp giờ/ngày, thống kê 3.4 và trực quan hóa 3.5. Kiểm định 3.6 và mô hình chưa thực hiện.

Notebook chính ở gốc dự án và notebook B1 trong ho_so_du_lieu đều dùng đường dẫn tương đối, đã chạy từ đầu tại thư mục khác. Notebook chính tái tạo các đầu ra từ hai CSV thô và power_clean_csv1.csv; đây chưa phải nghiệm thu quy trình làm sạch điện từ raw, vì mã gốc B1 còn chưa xác nhận. README hướng dẫn thư mục chạy và requirements.txt ghi phiên bản thư viện. Nhật ký đúng tên được trích từ các phiên thực đã ghi; không thêm lịch sử thử nghiệm hoặc đóng góp chưa có bằng chứng.



### 3.3.4. Đối chiếu phương án tái lập điện sạch

Nhóm đã thử phương án trong tài liệu tìm hiểu dữ liệu, mục 1.4, bằng notebook đối chiếu riêng. Phương án xử lý ký tự, chuyển số, đặt thiếu ngoài các ngưỡng có sẵn, gán chuỗi phút theo dòng rồi nội suy theo thời gian và điền biên. Các ngưỡng được giữ để đối chiếu, chưa được xem là chuẩn vật lý đã thẩm định. Trên lưới phút/giờ đều, nội suy time và linear cho cùng giá trị ở khoảng trống bên trong; cả hai có thể dùng điểm phía tương lai. B1 giữ nội suy time để đối chiếu phương án cũ, không dùng làm quy trình dự báo hợp lệ; thời tiết hiện đã chuyển sang ffill.

Kết quả có 2.075.259 dòng và toàn bộ nhãn thời gian khớp theo vị trí. Cả bảy cột số còn sai khác với rtol và atol bằng 1e-9; khi dùng rtol và atol bằng 1e-6 thì không có dòng vượt ngưỡng. Chênh lệch tuyệt đối lớn nhất của công suất tác dụng khoảng 6,67e-7 kW, điện áp khoảng 1,51e-5 V. Sai số tương đối phụ thuộc độ lớn giá trị nên không diễn giải tất cả sai khác tuyệt đối đều dưới 1e-6.

Đây là bằng chứng tái lập gần khớp về số học, chưa xác nhận nguồn gốc mã đã tạo file sạch, nguyên nhân sai khác hoặc tính đúng của các giá trị được điền. Hồ sơ chi tiết nằm trong ho_so_du_lieu/HO_SO_DIEN_B1.md; CSV đối chiếu và notebook được lưu riêng. Chưa dùng mặt nạ suy ra từ phương án làm lịch sử chỉnh sửa đã xác nhận. File điện sạch hiện có được giữ nguyên.


### 3.3.5. Chất lượng điện trước điền theo phương án tái lập

Nhóm đánh dấu các ô không đọc được thành số sau chuẩn hóa và các giá trị ngoài ngưỡng của phương án B1. Đây là các ô sẽ cần điền nếu áp dụng phương án đó, chưa phải lịch sử chỉnh sửa gốc đã được xác nhận. Cờ không đánh dấu cũng không chứng minh giá trị đo chính xác.

| Cột điện | Ô cần điền theo phương án | Tỷ lệ (%) |
|---|---:|---:|
| Global_​active_​power | 287,240 | 13.84 |
| Global_​reactive_​power | 185,309 | 8.93 |
| Voltage | 605,754 | 29.19 |
| Global_​intensity | 276,206 | 13.31 |
| Sub_​metering_​1 | 740,417 | 35.68 |
| Sub_​metering_​2 | 451,274 | 21.75 |
| Sub_​metering_​3 | 563,253 | 27.14 |

: Chất lượng bảy cột điện theo phương án tái lập {#tbl-chat-luong-b2}

*Nguồn: phần B2 trong notebook và bảng chat_luong_cot_dien_B2.csv. Các khoảng lọc được giữ từ phương án B1 để đối chiếu, chưa được coi là ngưỡng vật lý đã thẩm định.*

Công suất tác dụng có 287.240 phút cần điền theo phương án, chiếm 13,84%: gồm 196.665 phút không đọc được thành số và 90.575 phút ngoài ngưỡng. Có 1.442 ngày theo nhãn; 1.440 ngày đủ 1.440 phút. Hai ngày biên có 396 và 1.263 phút. Tất cả các ngày đều có ít nhất một phút bị đánh dấu.

Trong các ngày đủ thời lượng, 22 ngày có tỷ lệ cần điền từ 20% trở lên, 19 ngày từ 50% trở lên và 9 ngày là 100%. Các mốc này chỉ dùng mô tả, chưa dùng để loại ngày. Chín ngày gồm 29/04/2007, 14/06/2009, 13/01/2010, 18–21/08/2010 và 26–27/09/2010.

Nội suy khoảng trống có thể dùng giá trị phía tương lai. Vì vậy, không mặc nhiên coi trung bình ngày từ dữ liệu sạch là nhãn đo thực để chấm mô hình, đặc biệt ở các ngày được đánh dấu toàn bộ. Cần chốt quy tắc chất lượng nhãn và cách xử lý thông tin tương lai trước mô hình; chưa loại ngày hoặc tạo biến mục tiêu trong bước này. Các CSV nguồn, file sạch và bảng ghép giữ nguyên.


### 3.3.6. So sánh ngưỡng chất lượng trước khi tổng hợp ngày

Từ bảng chất lượng B2, có 1.440 ngày đủ 1.440 phút. Số ngày đạt ngưỡng tỷ lệ công suất cần điền tối đa 0%, 5%, 10%, 15%, 20%, 50%, 100% lần lượt là 0, 0, 1, 1.400, 1.418, 1.421, 1.440 ngày. Hai ngày biên không đủ thời lượng được xét riêng.

Nhóm đã chọn ngưỡng 20% cho phân tích thử và đối chiếu thêm ngưỡng 15%; giữ mọi ngày, chỉ gắn cờ. Các ngưỡng này là lựa chọn thực nghiệm, không phải tiêu chuẩn chất lượng cảm biến. Tỷ lệ theo ngày không kiểm soát được rò rỉ do nội suy dùng tương lai và không chứng minh nhãn ngày là số đo thực. Những vấn đề đó phải xử lý riêng trước đánh giá mô hình.

Code so sánh nằm ở C1; so_sanh_nguong_chat_luong_C1.csv lưu số liệu. Bảng điện ngày/giờ được trình bày dưới đây; chưa tạo biến mục tiêu ngày kế tiếp.


### 3.3.7. Tổng hợp điện theo ngày và gắn cờ chất lượng

Đọc riêng thời gian và công suất tác dụng từ Parquet, đưa công suất về float64 để tính tổng/trung bình; thao tác này không khôi phục phần chính xác đã mất khi hạ kiểu. Gom theo nhãn ngày đang lưu, chưa xác minh múi giờ tuyệt đối. Công suất trung bình tính bằng trung bình các phút; điện năng trong khoảng dữ liệu bằng tổng công suất phút chia 60.

Bảng dien_theo_ngay_C2.csv giữ đủ 1.442 ngày liên tục, gồm 1.440 ngày đủ 1.440 phút. Ghép chất lượng B2 theo ngày, gắn hai cờ: 1.418 ngày đạt ngưỡng 20%, 1.400 ngày đạt ngưỡng 15%. Không loại dòng hoặc làm đứt lịch ngày. Cột công suất phản ánh dữ liệu sạch gồm cả giá trị đã điền, không phải chỉ số đo gốc.

Ngày 16/12/2006 có 396 phút, điện năng trong khoảng dữ liệu khoảng 20,1418 kWh; ngày 26/11/2010 có 1.263 phút, khoảng 24,9794 kWh. Cột điện năng cả ngày ở hai dòng này để thiếu, không ngoại suy bằng trung bình nhân 24. Với ngày đủ thời lượng, đã đối chiếu điện năng bằng công suất trung bình nhân 24.

Kiểm tra tổng số phút bằng 2.075.259, số phút có công suất bằng số dòng và chất lượng ghép không thiếu. Đối chiếu tổng hợp với file điện sạch float64 cho sai lệch lớn nhất khoảng 5,21e-9 kW ở trung bình ngày và 1,25e-7 kWh ở điện năng. Đây là kiểm tra số học, không giải quyết chất lượng nhãn hoặc nội suy dùng tương lai.

Bước này chưa dịch biến mục tiêu sang ngày kế tiếp, chưa chia tập và chưa huấn luyện mô hình. Bảng giờ và tổng hợp thời tiết được trình bày ở hai mục tiếp theo; không cộng lượng mưa đã lặp theo phút.


### 3.3.8. Tổng hợp điện theo giờ và đối chiếu với bảng ngày

Đọc thời gian và công suất từ Parquet, chuyển công suất sang float64 để tính toán rồi ghép cờ cần điền B2 theo thời gian với khóa một-một. Gom theo đầu giờ của nhãn thời gian đang lưu; tính trung bình công suất, điện năng bằng tổng công suất phút chia 60, số phút và tỷ lệ phút cần điền.

Bảng dien_theo_gio_C3.csv có 34.589 giờ liên tục, trong đó 34.587 giờ đủ 60 phút. Giờ 17:00 ngày 16/12/2006 có 36 phút, điện năng trong khoảng dữ liệu khoảng 2,539033 kWh. Giờ 21:00 ngày 26/11/2010 có 3 phút, khoảng 0,046750 kWh. Điện năng cả giờ ở hai dòng này để thiếu, không ngoại suy. Công suất trung bình vẫn tính trên phần dữ liệu hiện có.

Với giờ đủ 60 phút, điện năng kWh bằng giá trị công suất trung bình kW nhân một giờ; công thức này đã được đối chiếu. Cộng bảng giờ trở lại 1.442 ngày: số phút và số phút cần điền khớp bảng C2, chênh lệch điện năng lớn nhất khoảng 1,42e-14 kWh, nằm trong dung sai tuyệt đối 1e-10 kWh của kiểm tra số học.

Bảng doi_chieu_gio_ngay_C3.csv lưu kết quả đối chiếu. Không áp ngưỡng 20%/15% của ngày trực tiếp cho giờ; bảng giờ giữ tỷ lệ cần điền để xem xét khi phân tích. Không xóa giờ hoặc thay đổi dữ liệu nguồn. Phép ghép thời tiết được trình bày ở mục tiếp theo; chưa khẳng định đồng bộ múi giờ tuyệt đối. Các giới hạn chất lượng công suất đã điền vẫn áp dụng.


### 3.3.9. Tổng hợp thời tiết và ghép bảng giờ/ngày

Thời tiết được đọc trực tiếp từ weather_clean_csv2.csv gồm 34.608 giờ, không lấy từ bảng đã lặp thời tiết theo phút. Khóa giờ không thiếu, không trùng, nằm ở đầu giờ. Có một ô nhiệt độ thiếu ở đầu chuỗi. Tổng hợp được 1.442 ngày đủ 24 nhãn giờ, trong đó 1.441 ngày đủ 24 giá trị ở cả năm biến; ngày đầu chỉ có 23 nhiệt độ hợp lệ. Trung bình bỏ qua ô thiếu nhưng ngày này được gắn cờ không đủ thời tiết; đồng thời cũng không đủ thời lượng điện nên không vào hai nhóm EDA. Mưa lấy tổng từ bảng giờ gốc.

Tổng mưa toàn khoảng dữ liệu sau làm sạch là 2.212,8 mm; tổng từ bảng giờ và tổng của các ngày khớp trong kiểm tra số học. Mưa thiếu từng được điền 0 theo giả định ở bước làm sạch, nên đây không phải tổng chỉ gồm các quan sát mưa gốc được xác minh.

Ghép trái một-một theo nhãn giờ/ngày đang lưu. Bảng điện-thời tiết theo giờ có 34.589 dòng, 15 cột; bảng theo ngày có 1.442 dòng, 20 cột. Không có dòng điện không khớp thời tiết; toàn bộ cột điện, thứ tự dòng và cờ chất lượng được đối chiếu giữ nguyên. Bảng thời tiết ngày lưu riêng có 1.442 dòng; chênh lệch số giờ giữa hai nguồn nằm ở phần biên, không thêm giờ điện không có dữ liệu.

Thời tiết của hai ngày biên là tổng hợp cả ngày, còn điện chỉ có một phần thời lượng; giữ nguyên cờ thiếu thời lượng và không coi đây là cặp quan sát đầy đủ để so sánh ngày. Các bảng ghép phục vụ phân tích bổ trợ theo nhãn, chưa chứng minh đồng bộ múi giờ tuyệt đối. Không dùng thời tiết quan sát của ngày cần dự báo như thông tin đã biết khi dự báo ngày kế tiếp.

Các đầu ra gồm thoi_tiet_theo_ngay_C4.csv, dien_thoi_tiet_theo_gio_C4.csv và dien_thoi_tiet_theo_ngay_C4.csv. Nhóm đã hoàn thành các bảng dẫn xuất giờ/ngày cho công suất và thời tiết; chưa tạo đặc trưng, Y ngày kế tiếp hoặc mô hình. Vấn đề nguồn nhãn và nội suy dùng tương lai vẫn cần xử lý trước đánh giá dự báo.


