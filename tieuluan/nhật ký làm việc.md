# Nhật ký làm việc — Tiểu luận PRJ-35

Bản trích các phiên liên quan từ nhật ký workspace, giữ ngày giờ ghi nhận và nội dung lịch sử; không tạo thêm phiên, prompt, phép thử hoặc kết quả. Các bản ghi có trợ lý AI hỗ trợ soạn. Không được dùng chúng để khẳng định sinh viên tự viết hoặc tự thực hiện độc lập toàn bộ mã.

**Cách đọc:** số liệu và “bước tiếp theo” phản ánh thời điểm từng phiên, có thể đã được thay thế trong báo cáo hiện hành. Các nhận định cũ quá mức được ghi rõ “Đính chính”, không giả vờ đã biết từ đầu. P/D/M/V chỉ giữ nếu bản ghi có; không bổ sung suy nghĩ quá khứ. Thời gian được chép từ nguồn, chưa có xác thực độc lập. Có những lượt người dùng yêu cầu không lưu nên nhật ký không bao phủ mọi chỉnh sửa.

**Minh chứng và đóng góp:** đường dẫn lịch sử có thể không còn là file đang dùng. Các mục không truy cập được không được coi là đã kiểm chứng lại. Mức đóng góp từng thành viên và lịch sử prompt đầy đủ còn cần xác nhận trước nộp. Nhật ký không phải lời cam đoan tự làm. Các phiên được yêu cầu không lưu không được bổ sung hồi tố; từ lượt chỉnh Chương 3, tiếp tục ghi các công việc chuyên môn mới.

---

## [2026-11-15 15:53] - PRJ-35: Kiểm định khám phá ngày thường và cuối tuần bằng HAC

- **Môi trường:** Windows, Python, NumPy, Pandas, SciPy 1.18.1, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Hoàn thành bước 3.6.2; người học xác nhận chưa học sai số chuẩn/HAC và đồng ý được giải thích, áp dụng từng bước.
- **Nội dung đã hoàn thành:** Thêm và chạy 3 cell trong [notebook](file:///c:/mypy/tieuluan/tieu_luan_prj35.ipynb): lịch tuần/tương quan, HAC, t-test ghép cặp tham khảo. Lưu [HAC](file:///c:/mypy/tieuluan/data/kiem_dinh_hac_3_6.csv) và [t-test](file:///c:/mypy/tieuluan/data/kiem_dinh_t_tham_khao_3_6.csv). Viết phương pháp, bảng kết quả và giới hạn vào [báo cáo](file:///c:/mypy/tieuluan/tieu_luan_prj35.qmd); cập nhật [lộ trình](file:///c:/mypy/tieuluan/lo_trinh_thuc_hien_prj35.qmd).
- **Quyết định kỹ thuật:** Giữ lịch 205 tuần với 195 tuần được chọn; 10 tuần bị loại đóng góp 0 vào tổng sai lệch HAC, không điền điện năng bằng 0. Dùng Bartlett L=4, độ nhạy 8/12; xấp xỉ chuẩn, không hiệu chỉnh mẫu nhỏ. Chênh lệch 4,6497 kWh/ngày; HAC 4 tuần có SE 0,6478, khoảng 95% [3,3800; 5,9193], p khoảng 7,09e-13. Suy luận khám phá có điều kiện; không chứng minh nhân quả, không khắc phục dữ liệu điền/nguồn nhãn. Người học chưa được xác nhận đã thành thạo phương pháp.
- **Kiểm chứng:** Chạy riêng 3 cell mới từ bảng cặp tuần đã lưu; không chạy lại pipeline lớn. Giữ nguyên 40 cell code trước đó. Đối chiếu tổng Bartlett và sai số chuẩn với Statsmodels S_hac_simple ở cả ba độ trễ, khớp trong sai số số học; Statsmodels chỉ dùng kiểm chứng ngoài notebook. Notebook hợp lệ, không có output lỗi; PDF báo cáo 21 trang và lộ trình 5 trang biên dịch thành công, đã xem trang kết quả và bước tiếp theo.
- **Tồn đọng & Bước tiếp theo:** Viết mục 2.4 cho phương pháp thống kê đã dùng và luyện giải thích code. Chốt nguồn nhãn/cách làm sạch hợp lệ theo thời gian trước Chương 4; chưa huấn luyện mô hình. Giả định ổn định/phụ thuộc ngắn hạn và cơ chế chọn tuần chưa được xác nhận đầy đủ.


## [2026-11-15 15:32] - PRJ-35 3.6.1: Chuẩn bị so sánh ngày thường và cuối tuần

- **Môi trường:** Windows, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu / P:** Bắt đầu 3.6 theo bước nhỏ; người dùng xác nhận chưa học kiểm định và muốn được giải thích từng bước.
- **Nội dung đã hoàn thành / D:** Giải thích H₀/H₁, p-value và ý nghĩa t-test ghép cặp. Thêm hai cell Pandas trong [notebook](tieu_luan_prj35.ipynb), tạo [phạm vi tuần](data/pham_vi_tuan_3_6.csv) và [cặp tuần](data/cap_ngay_thuong_cuoi_tuan_3_6.csv). Cập nhật mục 3.6.1 báo cáo/PDF và tiến độ lộ trình.
- **Quyết định kỹ thuật / M:** Một cặp gồm trung bình năm ngày thường và hai ngày cuối tuần của cùng tuần, đủ bảy ngày đạt cờ 20%; H₀ trung bình chênh lệch bằng 0, H₁ khác 0. Không giả định ghép theo tuần tự loại bỏ phụ thuộc thời gian. Đây là phân tích khám phá sau EDA, chưa đăng ký trước trên mẫu độc lập.
- **Kiểm chứng / V:** Đã chạy riêng hai cell mới với bảng ngày C4. Có 195 tuần/1.365 ngày; trung bình ngày thường 25,2027, cuối tuần 29,8524, chênh 4,6497 kWh/ngày. Kiểm tra khóa tuần duy nhất, số ngày 5/2 và công thức chênh lệch. Không chạy lại 38 cell cũ vì dữ liệu và mã cũ không đổi. Đã xuất và xem phần PDF cập nhật.
- **Tồn đọng & Bước tiếp theo:** 3.6.2: xem điều kiện phụ thuộc thời gian, giải thích/chọn phương pháp phù hợp và thực hiện kiểm định. Chưa có p-value, khoảng tin cậy hoặc kết luận ý nghĩa thống kê; chưa thêm SciPy hay mô hình.

## [2026-11-15 15:26] - PRJ-35: Rút gọn mã Chương 3 và chạy lại

- **Môi trường:** Windows, Python, Pandas, NumPy, Matplotlib, Seaborn, Jupyter Notebook.
- **Mục tiêu / P:** Rút gọn mã thật để đồng bộ cách trình bày Chương 3 đã thống nhất, không chỉ đổi tiêu đề.
- **Nội dung đã hoàn thành / D:** Giảm [notebook chính](tieu_luan_prj35.ipynb) từ 72 xuống 38 cell code; gộp cell tính/lưu quá nhỏ, gom import, bỏ phần in lặp và dùng lại bảng trong bộ nhớ. Số lời gọi read_csv trong mã giảm từ 27 còn 6; không phải số lần đọc khi vòng lặp chạy. Bỏ histogram riêng trùng nội dung dashboard; giữ ảnh cũ, dashboard hiện hành vẫn có histogram.
- **Giám sát / M:** Giữ quy tắc làm sạch, cờ chất lượng, kiểm tra khóa/số dòng, sai số hạ kiểu, đọc lại Parquet và tổng hợp giờ/ngày. Lượt chạy đầu phát hiện phép cộng vị trí cột biểu đồ trên category không hợp lệ; sửa bằng astype(int) tại vị trí vẽ. Không đổi cách tính các chỉ tiêu.
- **Kiểm chứng / V:** Chạy lại từ đầu tại bản sao thư mục khác; cả 38 cell thành công. So 34 tệp dữ liệu đầu ra với bản trước: 21 tệp giống từng byte, các tệp còn lại khớp số liệu với rtol/atol 1e-12; sai lệch số lớn nhất khoảng 7,11e-15. Notebook đã lưu kết quả chạy mới; các số liệu làm tròn trong báo cáo giữ nguyên.
- **Tồn đọng & Bước tiếp theo:** Thiết kế mục 3.6 sau khi giải thích phương pháp; chưa thực hiện kiểm định hoặc mô hình. Giới hạn nguồn nhãn điện vẫn cần giải quyết trước đánh giá dự báo.

## [2026-11-15 15:10] - PRJ-35: Tập trung lại Chương 3 theo khung giảng viên

- **Môi trường:** Windows, Jupyter Notebook, Quarto Typst.
- **Mục tiêu / P:** Theo yêu cầu người dùng, giảm phần đối chiếu dài và ưu tiên các nội dung chính 3.1–3.6.
- **Nội dung đã hoàn thành / D:** Gộp phần ghép/tối ưu thành ba mục, làm sạch thành bốn mục trong [báo cáo](tieu_luan_prj35.qmd). Tách chi tiết kiểm tra vào [hồ sơ kỹ thuật](ho_so_du_lieu/CHI_TIET_KIEM_TRA_CHUONG3.md). Sắp biểu đồ trước năm insight; ghi rõ 3.6 chưa thực hiện. Đồng bộ tiêu đề [notebook](tieu_luan_prj35.ipynb), [lộ trình](lo_trinh_thuc_hien_prj35.qmd), dàn ý và quy ước.
- **Quyết định kỹ thuật / M:** Giữ kiểm tra cần thiết trong code, không mở thêm vòng đối chiếu khi không có lỗi mới; không bỏ giới hạn nguồn nhãn hoặc dữ liệu đã điền. Không thêm phương pháp thống kê hoặc kết quả chưa chạy.
- **Kiểm chứng / V:** Đối chiếu toàn bộ 72 cell code trước/sau: mã, kết quả và thứ tự chạy không đổi; notebook hợp lệ. Không chạy lại xử lý dữ liệu vì chỉ đổi trình bày. Báo cáo xuất thành 19 trang so với 25 trang trước; đã xem các trang PDF sau chỉnh sửa.
- **Tồn đọng & Bước tiếp theo:** Thiết kế kiểm định 3.6, giải thích phương pháp mới trước khi dùng. Nguồn nhãn và xử lý điện theo thời gian vẫn cần chốt trước đánh giá mô hình; chưa hoàn thành Chương 2/4/5.

## [2026-11-14 22:33] - PRJ-35: Đồng bộ cấu trúc notebook với lộ trình

- **Môi trường:** Windows, Jupyter Notebook.
- **Mục tiêu / P:** Sắp xếp mã nguồn theo số mục khung giảng viên và lộ trình mới.
- **Hoàn thành / D:** Đổi tiêu đề và sắp các khối [notebook chính](<tieu_luan_prj35.ipynb>) theo 3.1 nguồn, 3.2 ghép/tối ưu, 3.3 làm sạch, 3.4 thống kê, 3.5 dashboard. Gắn link [B1 tại 3.3.4](<ho_so_du_lieu/B1_doi_chieu_lam_sach_dien.ipynb>). Không tạo chương chưa làm hoặc thêm kết luận vào code.
- **Giám sát / M:** Giữ nguyên tên biến, đường dẫn và file kết quả để không phá các bước đã làm. Phần 3.2 dùng file sạch đã có; thứ tự trình bày theo khung không được nhận là đã nghiệm thu toàn luồng tái tạo raw.
- **Kiểm chứng / V:** Đối chiếu theo ID cell: toàn bộ code, outputs và execution_count của notebook chính không thay đổi. Cấu trúc notebook hợp lệ, tất cả cell code biên dịch được. Không chạy lại các cell ghi dữ liệu.
- **Tồn đọng & Bước tiếp theo:** Tiếp tục ưu tiên 3.3 nguồn nhãn và rò rỉ nội suy; kiểm thử toàn luồng và đường dẫn tương đối còn ở bước nghiệm thu.

---

## [2026-11-14 22:23] - PRJ-35: Đồng bộ khung, barem và dashboard 300 DPI

- **Môi trường:** Windows, Pandas, NumPy, Matplotlib, Jupyter Notebook, Quarto.
- **Mục tiêu phiên / P (Plan):** Theo yêu cầu người dùng, ưu tiên rubric và đồng bộ khung đề; nâng cấp các biểu đồ thành dashboard vừa sức bảo vệ.
- **Nội dung đã hoàn thành / D (Do):** Đọc khung, sơ loại, rubric và PRJ-35 trong projects.qmd, kiểm tra projects (1).pdf. Viết lại [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>) theo 1.1–5.4 và các bằng chứng/việc thiếu; cập nhật dàn ý. Chuyển tối ưu về 3.2, insight về 3.5 trong [báo cáo](<tieu_luan_prj35.qmd>). Thêm code D6.2 và hai dashboard 300 DPI; tạo [bản dashboard](<dashboard_prj35.qmd>), xuất PDF và bổ sung danh sách code.
- **Giám sát / M (Monitor):** Giữ các ngày và kết quả gốc, hiển thị giới hạn nhóm đo/múi giờ/tương quan ngay trên hình. Không coi hình đẹp là đạt toàn rubric. EDA và mô hình mỗi trụ cột 2,5/10; sản phẩm 60% và bảo vệ 40% là hai tầng đánh giá riêng.
- **Kiểm chứng / V (Verify):** Dashboard 4.200×3.000 pixel, metadata 300 DPI; dùng lại CSV đã kiểm tra. Bố cục, nguồn, đơn vị, số ngày và đối chiếu hai ngưỡng được kiểm tra; notebook hợp lệ, đã chạy các cell dashboard. Chưa chạy lại toàn pipeline và chưa khẳng định đủ điều kiện sơ loại.
- **Quyết định kỹ thuật:** Dùng Matplotlib được người học xác nhận đã học; không thêm Plotly bắt buộc. Bản nộp còn cần đường dẫn tương đối, nhật ký đúng tên, APA/phụ lục và chạy toàn luồng. Ưu tiên đóng vấn đề nhãn/leakage trước mô hình, không đổi kết quả để tăng điểm.
- **Tồn đọng & Bước tiếp theo:** 3.3 xác minh nguồn nhãn/quy trình nội suy; Chương 2 và 3.6; 4.1–4.6; Chương 5 và bảo vệ. Chưa có lịch nộp xác nhận để chốt SMART, không tự đặt hạn.

---

## [2026-11-13 03:18] - PRJ-35 D5 và D6.1: Tổng hợp phát hiện, biểu đồ phân bố ngày

- **Môi trường:** Windows, Pandas, NumPy, Matplotlib, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Tổng hợp D1–D4 và bắt đầu trực quan hóa sau khi người dùng xác nhận đã học Matplotlib cơ bản, cho phép dùng.
- **Nội dung đã hoàn thành:** Bổ sung 5 phát hiện kèm giới hạn vào mục 3.4.6 [báo cáo](<tieu_luan_prj35.qmd>). Thêm và chạy D6.1 trong [notebook](<tieu_luan_prj35.ipynb>); lưu [histogram](<baocao/assets/phan_bo_dien_nang_D6.png>) và đưa vào mục 3.5.1. Cập nhật lộ trình/PDF, báo cáo/PDF và công dụng code vẽ.
- **Quyết định kỹ thuật:** Hai histogram có cùng bins 5 kWh từ 0–80 và chung thang trục; trục dọc đếm ngày. Tổng số ngày trong bins khớp 1.418/1.400; vùng 25–30 kWh nhiều ngày nhất ở cả hai nhóm. Giữ giá trị cao, không suy luận phân phối chuẩn hoặc lỗi từ hình. Kết luận chỉ trong báo cáo; D5 không thêm code giả hoặc kết luận vào notebook. Không thay đổi dữ liệu nguồn.
- **Tồn đọng & Bước tiếp theo:** D6.2 vẽ chu kỳ giờ bằng Matplotlib, sau đó thứ/tháng và thời tiết theo từng bước. Chưa kiểm định hoặc mô hình; các giới hạn dữ liệu đã nêu vẫn còn.

---

## [2026-11-13 02:49] - PRJ-35 D4: Giải thích và tính tương quan Pearson

- **Môi trường:** Windows, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Theo yêu cầu người dùng, giải thích Pearson rồi đưa vào bài dưới dạng phân tích bổ trợ.
- **Nội dung đã hoàn thành:** Chạy D4 trong [notebook](<tieu_luan_prj35.ipynb>); lưu [tương quan](<data/tuong_quan_dien_thoi_tiet_D4.csv>). Nhóm 20% có 1.418 ngày: nhiệt độ cảm nhận -0,5542, độ ẩm 0,4216, điểm sương -0,4747, gió 0,1350, mưa -0,0114. Nhóm 15% có 1.400 ngày cho hệ số gần nhau. Bổ sung giải thích và bảng vào mục 3.4.5, xuất báo cáo/PDF và lộ trình/PDF; cập nhật công dụng corr.
- **Quyết định kỹ thuật:** Kiểm tra đủ thời lượng, không thiếu các cặp, hệ số hữu hạn trong [-1,1]; đối chiếu phép tính với NumPy. Chỉ mô tả cùng nhãn ngày, chưa kiểm định hoặc điều chỉnh mùa. Không diễn giải r thành phần trăm hay nguyên nhân; không dùng thời tiết tương lai/đặc trưng chọn từ tập kiểm tra. Dữ liệu nguồn giữ nguyên.
- **Tồn đọng & Bước tiếp theo:** D5 tổng hợp phát hiện có giới hạn; sau đó trao đổi thư viện vẽ cho 3.5. B1, cân bằng nhóm đo, múi giờ và nhãn/nội suy dùng tương lai còn mở.

---

## [2026-11-13 02:45] - PRJ-35 D3: Cơ cấu nhóm đo và kiểm tra cân bằng

- **Môi trường:** Windows, Pandas, NumPy, PyArrow, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Xác nhận đơn vị UCI, quy đổi kWh, tính tỷ trọng và kiểm tra tổng trừ ba nhóm.
- **Nội dung đã hoàn thành:** Chạy D3 trong [notebook](<tieu_luan_prj35.ipynb>). Lưu [bảng ngày](<data/co_cau_dien_ngay_D3.csv>) và [tỷ trọng](<data/ty_trong_nhom_thiet_bi_D3.csv>). Ngưỡng 20%: nhóm 1/2/3 chiếm 6,11%/7,16%/35,21%; chênh lệch 51,53%. Cập nhật mục 3.4.4 báo cáo/PDF và lộ trình/PDF.
- **Quyết định kỹ thuật:** Wh chia 1.000; kW phút chia 60. Tỷ trọng là tỷ số các tổng cùng tập ngày. Có 16.173 phút chênh lệch âm dưới -1e-8 kWh, xác nhận cùng số lượng trên CSV float64; không clip. Trong nhóm 20% có 1.369 ngày chứa phút âm, nhưng 0 tổng ngày âm. Nhấn mạnh cờ 20%/15% chỉ đánh giá công suất, tỷ lệ cần điền ba nhóm B2 còn cao. Chưa coi chênh lệch là điện thiết bị khác hoặc tỷ trọng thực đã xác minh. Không có cú pháp mới ngoài danh sách đã có.
- **Tồn đọng & Bước tiếp theo:** D4 thời tiết bổ trợ; cần giải thích và hỏi về tương quan trước khi áp dụng nếu chưa học. B1, chất lượng nhóm đo, múi giờ và nhãn/nội suy dùng tương lai còn mở.

---

## [2026-11-13 02:23] - PRJ-35 D2: Thống kê chu kỳ giờ, thứ và tháng

- **Môi trường:** Windows, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** So sánh tiêu thụ theo lịch trên nhóm ngày đạt 20% và 15%.
- **Nội dung đã hoàn thành:** Chạy D2 trong [notebook](<tieu_luan_prj35.ipynb>). Lưu [giờ](<data/chu_ky_gio_D2.csv>), [thứ](<data/chu_ky_thu_D2.csv>) và [tháng](<data/chu_ky_thang_D2.csv>). Cả hai ngưỡng: cao/thấp là 20h/4h, thứ Bảy/thứ Năm, tháng 12/tháng 8. Cập nhật mục 3.4.3 báo cáo/PDF, lộ trình/PDF và công dụng cú pháp thời gian.
- **Quyết định kỹ thuật:** Bảng giờ chỉ gồm 24 giờ của các ngày đạt ngưỡng, không áp ngưỡng ngày trực tiếp cho giờ. Gộp tháng qua các năm, lưu số quan sát và so sánh trung bình ngày. Kiểm tra nhóm đủ 24/7/12 mức, tổng số quan sát và trung bình có trọng số khớp nguồn. Không suy luận nguyên nhân hoặc kiểm định; dữ liệu nguồn giữ nguyên.
- **Tồn đọng & Bước tiếp theo:** D3 kiểm tra đơn vị và cơ cấu nhóm thiết bị. Chưa vẽ biểu đồ, tạo Y hoặc mô hình. B1, múi giờ, nhãn và nội suy dùng tương lai còn mở.

---

## [2026-11-13 02:06] - PRJ-35 D1: Thống kê mô tả điện ngày

- **Môi trường:** Windows, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Thống kê phân bố công suất/điện năng, đối chiếu ngưỡng 20% và 15%, xem các ngày cao nhất.
- **Nội dung đã hoàn thành:** Chạy D1 trong [notebook](<tieu_luan_prj35.ipynb>); lưu [thống kê](<data/thong_ke_mo_ta_ngay_D1.csv>) và [10 ngày cao nhất](<data/top10_dien_nang_ngay_D1.csv>). Nhóm 20%/15% có 1.418/1.400 ngày, trung bình 26,4512/26,4244 kWh (khác khoảng 0,10%). Cao nhất 23/12/2006: 79,4912 kWh. Cập nhật mục 3.4 báo cáo/PDF, lộ trình/PDF.
- **Quyết định kỹ thuật:** Dùng describe và sắp xếp Pandas, không thêm thư viện. Hai nhóm lồng nhau, không coi là mẫu độc lập. Không tự xóa hoặc cắt đỉnh vì chưa chứng minh là lỗi. Nhận xét chỉ trong báo cáo, không trong notebook. Chưa vẽ biểu đồ, kiểm định, tạo Y hay mô hình.
- **Tồn đọng & Bước tiếp theo:** D2 chu kỳ giờ, thứ và tháng; giải thích cú pháp mới khi cần. B1, múi giờ, nguồn nhãn và nội suy dùng tương lai còn mở.

---

## [2026-11-12 23:43] - PRJ-35 C4: Tổng hợp và ghép thời tiết giờ/ngày

- **Môi trường:** Windows, Pandas, NumPy, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Tổng hợp từ thời tiết giờ gốc và ghép với điện, tránh cộng mưa lặp theo phút.
- **Nội dung đã hoàn thành:** Chạy C4 trong [notebook](<tieu_luan_prj35.ipynb>). Lưu [thời tiết ngày](<data/thoi_tiet_theo_ngay_C4.csv>), [bảng ghép giờ](<data/dien_thoi_tiet_theo_gio_C4.csv>) và [bảng ghép ngày](<data/dien_thoi_tiet_theo_ngay_C4.csv>). Có 1.442 ngày thời tiết đủ 24 giờ; bảng ghép 34.589 giờ/1.442 ngày không thiếu khớp. Cập nhật báo cáo/PDF, lộ trình/PDF và quy ước.
- **Quyết định kỹ thuật:** Tổng mưa sau làm sạch 2.212,8 mm khớp khi gom ngày; trung bình 4 biến còn lại. Ghép trái một-một, kiểm tra toàn bộ cột điện và cờ không đổi. Hai ngày biên điện thiếu vẫn giữ cờ dù thời tiết đủ ngày. Không dịch múi giờ, không tạo đặc trưng/Y, không đổi nguồn. Không phát sinh cú pháp mới cần bổ sung danh sách.
- **Tồn đọng & Bước tiếp theo:** D1 thống kê phân bố điện, đối chiếu 20%/15%. B1, nguồn nhãn, nội suy dùng tương lai và múi giờ chưa khép; chưa huấn luyện mô hình.

---

## [2026-11-12 23:32] - PRJ-35 C3: Tổng hợp điện theo giờ

- **Môi trường:** Windows, Pandas, NumPy, PyArrow, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Tạo bảng điện giờ, cờ chất lượng và đối chiếu với bảng ngày C2.
- **Nội dung đã hoàn thành:** Chạy phần C3 trong [notebook](<tieu_luan_prj35.ipynb>); lưu [bảng giờ](<data/dien_theo_gio_C3.csv>) và [đối chiếu giờ-ngày](<data/doi_chieu_gio_ngay_C3.csv>). Có 34.589 giờ liên tục, 34.587 giờ đủ 60 phút. Hai giờ biên có 36 và 3 phút, để thiếu điện năng cả giờ. Cập nhật báo cáo/PDF, lộ trình/PDF và quy ước.
- **Quyết định kỹ thuật:** Đọc hai cột Parquet, chuyển công suất về float64, ghép cờ B2 một-một. Kiểm tra tổng số phút, số giá trị, công thức điện năng; cộng về 1.442 ngày khớp số phút và số cờ, sai lệch điện năng tối đa 1,42e-14 kWh (dung sai 1e-10). Không áp ngưỡng chất lượng ngày cho giờ. Không thêm cú pháp mới ngoài danh sách đã có, không đổi nguồn hoặc ghép thời tiết.
- **Tồn đọng & Bước tiếp theo:** C4 tổng hợp thời tiết từ bảng giờ gốc và ghép với điện giờ/ngày. Chưa tạo Y hoặc mô hình; B1 và rò rỉ nội suy/nguồn nhãn còn mở.

---

## [2026-11-12 23:14] - PRJ-35 C2: Tổng hợp điện ngày theo quy tắc đã chốt

- **Môi trường:** Windows, Pandas, NumPy, PyArrow, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Áp dụng lựa chọn 20% cần điền, đối chiếu 15%; tạo bảng điện ngày.
- **Nội dung đã hoàn thành:** Chạy C2 trong [notebook](<tieu_luan_prj35.ipynb>); lưu [bảng ngày](<data/dien_theo_ngay_C2.csv>) gồm 1.442 ngày liên tục, 1.418/1.400 ngày đạt ngưỡng 20%/15%. Tính trung bình kW, tổng công suất phút chia 60 thành kWh; hai ngày biên để thiếu điện năng cả ngày. Cập nhật quy ước, hồ sơ C1, báo cáo/PDF và lộ trình/PDF.
- **Quyết định kỹ thuật:** Đọc hai cột Parquet, chuyển công suất sang float64 trước tổng hợp. Kiểm tra tổng phút, số giá trị, ghép chất lượng, công thức điện năng, số cờ và lịch ngày. So với nguồn float64: sai lệch trung bình tối đa 5,21e-9 kW, điện năng 1,25e-7 kWh. Không xóa ngày, không thay đổi nguồn hoặc tạo Y ngày kế tiếp; cờ phân tích không phải xác nhận nhãn chấm mô hình.
- **Tồn đọng & Bước tiếp theo:** C3 tạo bảng điện giờ, rồi tổng hợp thời tiết từ bảng giờ gốc. B1 và rò rỉ nội suy/nguồn nhãn chưa khép; chưa sang mô hình.

---

## [2026-11-12 22:57] - PRJ-35 C1: So sánh ngưỡng chất lượng ngày

- **Môi trường:** Windows, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Chuẩn bị quy tắc chất lượng trước tổng hợp ngày, dùng lại cờ B2.
- **Nội dung đã hoàn thành:** Chạy phần C1 trong [notebook](<tieu_luan_prj35.ipynb>); lưu [bảng so sánh](<data/so_sanh_nguong_chat_luong_C1.csv>) và [đề xuất](<ho_so_du_lieu/DE_XUAT_CHAT_LUONG_NGAY_C1.md>). Trong 1.440 ngày đủ thời lượng, ngưỡng tối đa 15%/20% cần điền giữ 1.400/1.418 ngày; ngưỡng 0% giữ 0 ngày. Cập nhật báo cáo và lộ trình.
- **Quyết định kỹ thuật:** Chỉ so sánh, chưa chốt ngưỡng hoặc loại ngày. Đề xuất 20% cho phân tích thử, đối chiếu 15%; không coi đây là chuẩn chất lượng hay giải pháp rò rỉ nội suy. Giữ lịch ngày liên tục khi tạo biến trễ. Không thêm cú pháp mới ngoài danh sách đã có.
- **Tồn đọng & Bước tiếp theo:** Chờ người dùng chọn quy tắc; sau đó tổng hợp từng bước. B1 và vấn đề nhãn/tương lai vẫn chưa giải quyết; chưa mô hình hóa.

---

## [2026-11-12 22:51] - PRJ-35 B3.3: Lưu Parquet và hoàn thành B3

- **Môi trường:** Windows, Python, Pandas 3.0.5, PyArrow 26.0.1, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Lưu bản float32 thành Parquet và đọc lại đối chiếu sau khi người học đã được giải thích và đồng ý.
- **Nội dung đã hoàn thành:** Cài PyArrow; bổ sung và chạy B3.3 trong [notebook](<tieu_luan_prj35.ipynb>). Lưu [Parquet](<data/merged_minute_float32_B3.parquet>) nén Snappy; đọc lại 2.075.259 dòng, 15 cột khớp hoàn toàn giá trị, kiểu, cột và chỉ mục. Lưu [kiểm tra](<data/kiem_tra_parquet_B3.csv>) và [dung lượng](<data/dung_luong_luu_tru_B3.csv>). Cập nhật [báo cáo](<tieu_luan_prj35.qmd>), [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>) và PDF.
- **Quyết định kỹ thuật:** Parquet 28.387.849 byte (27,07 MiB), CSV 250.460.714 byte (238,86 MiB), giảm 88,67% trên đĩa. RAM đọc lại 142,50 MiB. Kết quả phản ánh đồng thời hạ kiểu, định dạng và nén; chưa đo tốc độ. Không tạo sai số mới khi ghi/đọc Parquet so với float32; vẫn có sai số hạ kiểu đã báo ở B3.2. SHA-256 CSV bảng ghép không đổi.
- **Tồn đọng & Bước tiếp theo:** B3 hoàn thành. Bước C bắt đầu bằng thống nhất chất lượng ngày và cách xử lý nhãn được điền trước tổng hợp; B1 còn thiếu xác nhận mã/ngưỡng. Chưa tạo bảng giờ/ngày hoặc mô hình.

---

## [2026-11-12 22:29] - PRJ-35 B3.2: Thử float32 và kiểm tra sai số

- **Môi trường:** Windows, Python, NumPy, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Thực hiện thử hạ kiểu trên bản sao sau khi giải thích và được người dùng yêu cầu tiếp tục.
- **Nội dung đã hoàn thành:** Thêm và chạy B3.2 trong [notebook](<tieu_luan_prj35.ipynb>). Chuyển 12 cột số sang float32, giữ ba cột thời gian; bộ nhớ giảm từ 237,49 xuống 142,50 MiB (gần 40%). Lưu [sai số](<data/sai_so_float32_B3.csv>) và [so sánh bộ nhớ](<data/so_sanh_bo_nho_B3.csv>). Cập nhật [báo cáo](<tieu_luan_prj35.qmd>) và [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>), xuất lại PDF.
- **Quyết định kỹ thuật:** Kiểm tra số dòng/cột, chỉ mục, ô thiếu và cột thời gian không đổi. Không có giá trị vượt rtol=1e-6, atol=1e-8 trong 12 cột; đây là dung sai số học, chưa đánh giá ảnh hưởng mô hình. CSV nguồn không đổi; chỉ bản sao trong bộ nhớ được chuyển kiểu. Chưa lưu dữ liệu float32 hoặc Parquet.
- **Tồn đọng & Bước tiếp theo:** B3.3 giải thích Parquet và thống nhất trước khi áp dụng; sau đó lưu và đọc lại đối chiếu. B1 còn thiếu xác nhận mã/ngưỡng; chưa sang tổng hợp ngày hoặc mô hình.

---

## [2026-11-12 22:25] - PRJ-35 B3.1: Đo bộ nhớ trước tối ưu

- **Môi trường:** Windows, Python, Pandas, Jupyter Notebook, Quarto.
- **Mục tiêu phiên:** Giải thích và thực hiện riêng phần đo RAM theo lựa chọn của người học.
- **Nội dung đã hoàn thành:** Thêm và chạy ba cell B3.1 trong [notebook](<tieu_luan_prj35.ipynb>); bảng ghép 2.075.259 dòng, 15 cột chiếm 249.031.212 byte (237,49 MiB), gồm chỉ mục 132 byte. Lưu [kết quả từng cột](<data/bo_nho_bang_ghep_B3.csv>); cập nhật [báo cáo](<tieu_luan_prj35.qmd>) và [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>).
- **Quyết định kỹ thuật:** Đo DataFrame sau khi parse ba cột thời gian; không coi đây là tổng RAM tiến trình hoặc đỉnh bộ nhớ. Kiểm tra tổng bộ nhớ các cột cộng chỉ mục khớp phép đo toàn bảng. Không đổi kiểu số, không sửa dữ liệu nguồn, không lưu Parquet. B3 chưa hoàn tất.
- **Tồn đọng & Bước tiếp theo:** Giải thích float64/float32 và thống nhất với người học trước khi thử hạ kiểu có đối chiếu sai số; Parquet để bước sau. B1 còn thiếu xác nhận mã/ngưỡng.

---

## [2026-11-12 21:10] - PRJ-35: Rút gọn trình bày mã nguồn đã làm

- **Môi trường:** Windows, Jupyter Notebook, Python.
- **Mục tiêu phiên:** Giữ notebook tập trung vào xử lý dữ liệu và kết quả chạy theo trình độ NumPy/Pandas của người học.
- **Nội dung đã hoàn thành:** Rút gọn [notebook chính](<tieu_luan_prj35.ipynb>) và [notebook B1](<ho_so_du_lieu/B1_doi_chieu_lam_sach_dien.ipynb>) thành tiêu đề, code và kết quả; bỏ đoạn kết luận, chú thích dài và cell chỉ in tiêu đề. Bỏ hai câu in gán nguyên nhân kiểu object cho dữ liệu lỗi mà chưa có kiểm chứng. Kiểm tra cấu trúc notebook, cú pháp và đối chiếu AST xác nhận các phép xử lý dữ liệu được giữ nguyên.
- **Quyết định kỹ thuật:** Giữ kết quả tính toán đã có; không chạy lại hoặc ghi đè CSV. Nhận xét chuyên môn tiếp tục nằm trong báo cáo và hồ sơ dữ liệu. Trước khi đưa kỹ thuật ngoài phạm vi đã học vào bài, hỏi người học và giải thích mức độ phù hợp. Không cập nhật file Python cũ.
- **Tồn đọng & Bước tiếp theo:** Tiến độ chuyên môn vẫn sau B2, chưa thực hiện B3. Khi bắt đầu B3, trao đổi trước về hạ kiểu dữ liệu và Parquet; B1 còn cần xác nhận nguồn mã/ngưỡng.

---

## [2026-11-12 10:27] - PRJ-35, B2: Đánh giá chất lượng điện theo phương án tái lập

- **Môi trường:** Windows, Python, Pandas, NumPy, Jupyter Notebook, Quarto Typst.
- **Mục tiêu phiên:** Xác định cờ cần điền của các giá trị điện theo phương án đã đối chiếu B1 và thống kê chất lượng nhãn ngày trước khi dự báo.
- **Nội dung đã hoàn thành:**
  - Thực hiện B2 trong [notebook](<tieu_luan_prj35.ipynb>), không ghi đè dữ liệu sạch. Cột công suất tác dụng có 287.240/2.075.259 phút cần điền theo phương án, chiếm 13,8412%; gồm 196.665 không đọc được thành số sau chuẩn hóa và 90.575 ngoài ngưỡng.
  - Lưu [chất lượng từng cột](<data/chat_luong_cot_dien_B2.csv>), [cờ công suất từng phút](<data/co_chat_luong_cong_suat_B2.csv>) và [chất lượng theo ngày](<data/chat_luong_ngay_dien_B2.csv>). Có 1.442 ngày theo nhãn, 1.440 ngày đủ thời lượng; 9 ngày bị đánh dấu toàn bộ 1.440 phút.
  - Lập [hồ sơ B2](<ho_so_du_lieu/HO_SO_CHAT_LUONG_DIEN_B2.md>), cập nhật mục 3.3.5 của [báo cáo](<tieu_luan_prj35.qmd>) và tiến độ [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>).
  - Đối chiếu tổng số phút, số cờ giữa bảng cột/ngày và file đã ghi; hai nhóm lý do không chồng lặp. Hash dữ liệu nguồn, file sạch, bảng ghép và Python cũ không thay đổi.
- **Quyết định kỹ thuật:** Cờ suy ra từ phương án tái lập, không nhận là lịch sử chỉnh sửa gốc hoặc chứng minh ngưỡng vật lý đúng. Không loại ngày, không tạo Y và không nội suy lại. Nêu rõ nội suy có thể dùng giá trị phía tương lai; không coi nhãn ngày được điền toàn bộ là số đo thực để đánh giá mô hình. B1 còn thiếu xác nhận mã gốc và cơ sở ngưỡng.
- **Tồn đọng & Bước tiếp theo:** B3 đo RAM, thử hạ kiểu có kiểm tra sai số và lưu Parquet dẫn xuất. Trước bước C/F cần chốt quy tắc ngày đủ chất lượng, kiểm soát nhãn được điền và thông tin tương lai. Phiên này ghi đúng bước B2; không ghi bù các phiên đã yêu cầu không lưu.

---

## [2026-11-11 16:34] - Chương 3, Bước 3.2a: Đối chiếu quy ước thời gian hai nguồn

- **Môi trường:** Windows, Python, Pandas, Jupyter Notebook, Quarto Typst.
- **Mục tiêu phiên:** Làm rõ cách diễn giải thời gian của bảng điện và thời tiết trước khi ghép chính thức.
- **Nội dung đã hoàn thành:**
  - Đối chiếu tài liệu nguồn UCI, tài liệu Historical Weather API của Open-Meteo và quy trình tái tạo thời gian mô tả trong tài liệu nội bộ.
  - Chạy kiểm tra và lưu kết quả trong [notebook](<tieu_luan_prj35.ipynb>): 1.317.693 mốc điện và 26.928 mốc thời tiết thô đọc được đều khớp file sạch ở cùng vị trí dòng; không có nhãn bị dịch giờ trong phần đối chiếu được.
  - Xác định cách quy đổi thời tiết từ offset cố định 7200 giây theo metadata và tài liệu API. Chuỗi UTC kiểm tra chạy từ 15/12/2006 22:00 đến 26/11/2010 21:00, không thiếu và không trùng.
  - Trang UCI không nêu múi giờ của Date/Time; tài liệu nội bộ dùng `pd.date_range` không gắn múi giờ. Phép thử giả định điện là giờ Paris đánh dấu 480 mốc phút mơ hồ hoặc không tồn tại tại 8 ngày chuyển giờ mùa hè trong 2007–2010.
  - Bổ sung mục 3.2.2 vào [báo cáo](<tieu_luan_prj35.qmd>), xuất [PDF báo cáo](<tieu_luan_prj35.pdf>) và cập nhật [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>) cùng [PDF lộ trình](<lo_trinh_thuc_hien_prj35.pdf>).
- **Quyết định kỹ thuật:** Giữ nguyên các file dữ liệu; chỉ tạo cột UTC thời tiết trong bộ nhớ để kiểm tra. Không tự gán UTC offset cho điện, không dịch/xóa 480 mốc theo giả định Paris. Kiểm tra nguồn đã hoàn tất, nhưng chưa đủ căn cứ xác nhận đồng bộ thời điểm tuyệt đối.
- **Tồn đọng & Bước tiếp theo:** Bước 3.2a.1: cần thông tin từ nguồn hoặc người bàn giao về quy ước Date/Time gốc của CSV1 (UTC, offset cố định hay giờ địa phương có đổi giờ). Chưa thực hiện bước ghép 3.2b; nếu thiếu thông tin nguồn, mọi lựa chọn tiếp theo phải được ghi rõ là giả định và đánh giá độ nhạy.

---

## [2026-11-11 15:01] - Chương 3, Bước 3.2.1: Kiểm tra khóa thời gian trước khi ghép bảng

- **Môi trường:** Windows, Python, Pandas, Jupyter Notebook, Quarto Typst.
- **Mục tiêu phiên:** Tiếp tục Chương 3 theo khung đề bài, sử dụng lại dữ liệu sạch đã có và kiểm tra điều kiện ghép bảng điện với thời tiết.
- **Nội dung đã hoàn thành:**
  - Đọc hai file sạch và chạy kiểm tra trong [tieu_luan_prj35.ipynb](<tieu_luan_prj35.ipynb>): điện 2.075.259 dòng, 8 cột; thời tiết 34.608 dòng, 6 cột.
  - Xác nhận hai cột thời gian không thiếu, không trùng và tăng dần; khoảng cách giữa các dòng điện là 1 phút, thời tiết là 1 giờ.
  - Tạo khóa giờ dự kiến: 34.589 mốc giờ điện; toàn bộ 2.075.259 dòng điện có khóa giờ xuất hiện trong bảng thời tiết. Chưa ghép bảng hoặc xuất dữ liệu tích hợp.
  - Phát hiện hai file sạch chưa lưu múi giờ, trong khi metadata thời tiết ghi Europe/Berlin, UTC offset 7200 giây và GMT+2. Chưa đủ căn cứ xác nhận đồng bộ thời điểm tuyệt đối.
  - Sắp xếp nội dung đã có theo Chương 3 và bổ sung mục 3.2.1 vào [báo cáo](<tieu_luan_prj35.qmd>); xuất [PDF báo cáo](<tieu_luan_prj35.pdf>). Cập nhật [lộ trình](<lo_trinh_thuc_hien_prj35.qmd>) và [PDF lộ trình](<lo_trinh_thuc_hien_prj35.pdf>).
- **Quyết định kỹ thuật:** Dự kiến giữ bảng điện cấp phút và ghép trái nhiều-một để đáp ứng yêu cầu tối thiểu 100.000 dòng sau ghép. Bảng theo giờ là sản phẩm phân tích riêng. Kết quả khớp nhãn thời gian không được diễn giải thành bằng chứng hai nguồn đã đồng bộ múi giờ.
- **Tồn đọng & Bước tiếp theo:** Bước 3.2a của lộ trình: đối chiếu nguồn và quy trình tạo file sạch để làm rõ múi giờ, sau đó mới ghép bảng chính thức và kiểm tra bảo toàn số dòng.

---

## [2026-10-20 11:10] - Tái cấu trúc toàn diện Báo cáo Hiểu Dữ liệu PRJ-35 và Biên dịch Xuất bản PDF
- **Môi trường:** Windows 11, Quarto CLI 1.10 (Typst engine), Python 3.13, Pandas 2.x
- **Mục tiêu phiên:** Tái cấu trúc nội dung báo cáo theo đúng trình tự logic người dùng yêu cầu: Giới thiệu bảng $\rightarrow$ Bảng có những gì, kiểu dữ liệu, ý nghĩa giá trị $\rightarrow$ Nhận diện các lỗi có trong bảng $\rightarrow$ Phương án và quy trình xử lý lỗi bằng Python; sau đó biên dịch xuất bản tệp PDF hoàn chỉnh.
- **Nội dung đã hoàn thành:**
  - Bổ sung cấu hình YAML Frontmatter chuẩn Quarto Typst (khổ giấy A4, lề chuẩn, mục lục tự động `toc: true`, đánh số đề mục `number-sections: true`).
  - Biên dịch thành công tệp PDF báo cáo: BAO_CAO_HIEU_DU_LIEU_PRJ35.pdf (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/BAO_CAO_HIEU_DU_LIEU_PRJ35.pdf`; chưa kiểm chứng lại) (dung lượng ~458 KB) và đồng bộ sang `C:\Users\thesh\Downloads\BÁO CÁO HIỂU DỮ LIỆU PRJ-35.pdf`.
  - Cập nhật và đồng bộ tệp `C:\Users\thesh\Downloads\BÁO CÁO HIỂU DỮ LIỆU PRJ-35.qmd` (và bản lưu trữ c:/mypy/tieuluan/BAO_CAO_HIEU_DU_LIEU_PRJ35.qmd (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/BAO_CAO_HIEU_DU_LIEU_PRJ35.qmd`; chưa kiểm chứng lại)):
    - **Tổng quan hệ thống dữ liệu & Bối cảnh kinh doanh:** Đưa lên đầu bài viết làm cơ sở nền tảng (Bản chất hoạt động Smart Grid AMI hộ gia đình Sceaux - Paris; 2 phòng ban quản lý; cơ chế 2 nguồn dữ liệu độc lập).
    - **Phần 1 — Bảng Điện năng (CSV1):**
      1. *Bảng này là bảng gì:* Bảng chuỗi thời gian phụ tải điện gia đình 1 phút/lần, 2.075.259 dòng × 9 cột.
      2. *Bảng có cái gì, kiểu dữ liệu & ý nghĩa:* Bảng Data Dictionary 9 cột (kiểu gốc, kiểu chuẩn hóa, đơn vị, miền giá trị); giải thích chi tiết ý nghĩa kinh tế & kỹ thuật của từng biến (`Date`, `Time`, `Global_active_power` - target Y, `Global_reactive_power`, `Voltage`, `Global_intensity`, `Sub_metering_1/2/3`).
      3. *Nhận diện lỗi có trong bảng:* Bản chất 7 nhóm dị tật (NaN `;;`, ký hiệu rỗng, tạp chất đơn vị, dấu phẩy thập phân, sentinel ≥ 9000, số âm, ngoại lai EN 50160) và bảng thống kê số ô lỗi/tỷ lệ % từng cột (tổng 4,810,672 ô lỗi, chiếm 25.76%).
      4. *Phương án & Quy trình xử lý lỗi:* Nguyên tắc không `dropna`; mã nguồn Python 5 bước chuẩn mực (Regex, ép kiểu số, gán NaN cho sentinel/âm/ngoại lai, tái tạo trục thời gian 1 phút/mẫu, nội suy tuyến tính `interpolate(method='time')` + `ffill()`/`bfill()`).
    - **Phần 2 — Bảng Khí tượng (CSV2):**
      1. *Bảng này là bảng gì:* Bảng chuỗi thời gian thời tiết lịch sử Paris (Open-Meteo API), 34.608 dòng × 6 cột, tần suất 1 giờ/lần, tọa độ tương thích 100% với CSV1.
      2. *Bảng có cái gì, kiểu dữ liệu & ý nghĩa:* Bảng Data Dictionary 6 cột (`time`, `RELATIVE_HUMIDITY_2M`, `dew_point_2m`, `apparent_temperature`, `wind_speed_10m`, `precipitation`).
      3. *Nhận diện lỗi có trong bảng:* Ký hiệu rỗng chuỗi; phân biệt false positive chữ `T` trong ISO 8601 (không phải lỗi) và giá trị nhiệt độ âm (hiện tượng tự nhiên mùa đông Paris, không được xóa).
      4. *Phương án & Quy trình xử lý lỗi:* Code Python xử lý bỏ metadata `skiprows=2`, đổi tên cột snake_case, tái tạo trục 1 giờ/lần, nội suy nhiệt độ/độ ẩm/gió và gán 0.0 mm cho lượng mưa.
    - **Phần 3 & 4 — Tích hợp & Mục tiêu phân tích:** Đối soát tổng hợp, quy trình resample 1 phút sang 1 giờ rồi merge, và 3 câu hỏi kinh doanh cốt lõi (Q1, Q2, Q3).
- **Quyết định kỹ thuật:** Sử dụng Quarto kết hợp Typst engine giúp quá trình biên dịch PDF diễn ra tức thì, giao diện và kiểu chữ chuẩn học thuật, định dạng bảng rõ nét không bị vỡ.
- **Tồn đọng & Bước tiếp theo:** Người dùng duyệt nội dung và bố cục bản PDF; sẵn sàng thuyết minh hoặc nộp báo cáo.

---

## [2026-10-20 08:55] - Hoàn thành Bước 1.5: Xác định 3 Câu hỏi Kinh doanh Thực tế cam kết Giải quyết bằng Python
- **Môi trường:** Windows 11, Quarto CLI 1.10 (Typst), Python 3.13, Pandas 2.x
- **Mục tiêu phiên:** Xác định và viết chính thức 3 câu hỏi kinh doanh trọng tâm (Business Questions) cam kết giải quyết bằng phân tích dữ liệu Python; cập nhật đồng bộ [tieu_luan_prj35.pdf](<tieu_luan_prj35.pdf>) và tieu_luan_prj35.py (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/tieu_luan_prj35.py`; chưa kiểm chứng lại).
- **Nội dung đã hoàn thành:**
  - Q1: Hành vi Tiêu thụ Điện theo Chu kỳ Thời gian và Xác định Phụ tải Đỉnh — phân tích mô hình biến thiên giờ/ngày/mùa, xác định đỉnh phụ tải, kiểm định t-test và ANOVA cho ngày thường vs cuối tuần.
  - Q2: Phân rã Cơ cấu Năng lượng theo Nhóm Thiết bị và Tác động Thời tiết — xác định nhóm thiết bị tiêu thụ nhiều nhất (Bếp/Giặt ủi/Điều nhiệt), phân tích tương quan nhiệt độ–phụ tải.
  - Q3: Dự báo Phụ tải Tiêu thụ Ngắn hạn bằng Mô hình Học máy — so sánh ≥3 mô hình (Linear/Ridge/Lasso/Random Forest), đánh giá R², RMSE, MAE trên Test set chia theo thời gian.
  - Bổ sung mục "Câu hỏi Kinh doanh Thực tế" vào [tieu_luan_prj35.qmd](<tieu_luan_prj35.qmd>) và biên dịch ra [tieu_luan_prj35.pdf](<tieu_luan_prj35.pdf>).
  - Viết hàm `cau_hoi_kinh_doanh()` trong tieu_luan_prj35.py (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/tieu_luan_prj35.py`; chưa kiểm chứng lại) và chạy xác thực thành công.
- **Quyết định kỹ thuật:**
  - 3 câu hỏi được thiết kế theo cấu trúc phân tầng: Mô tả (Q1) → Giải thích (Q2) → Dự báo (Q3), phù hợp với phương pháp luận CRISP-DM và yêu cầu đề tài PRJ-35.
  - Mỗi câu hỏi kèm Ý nghĩa kinh doanh thực tế và Phương pháp phân tích dự kiến.
- **Tồn đọng & Bước tiếp theo:** Hoàn thành toàn bộ Giai đoạn 1 (Business Understanding); chuyển sang Giai đoạn 2: Làm sạch Dữ liệu (Data Cleaning & Preprocessing).

---

## [2026-10-19 13:58] - Hoàn thành Bước 1.4: Kiểm toán Độ sạch Ban đầu & Biện luận Ngoại lai; Xuất Báo cáo PDF & Python Đồng bộ
- **Môi trường:** Windows 11, Quarto CLI 1.10 (Typst), Python 3.13, Pandas 2.x
- **Mục tiêu phiên:** Thực hiện kiểm toán toàn diện chất lượng bộ dữ liệu ban đầu cho cả hai bảng: kiểm tra tỷ lệ khuyết thiếu, rà soát giới hạn biên vật lý, và biện luận bản chất ngoại lai (Domain-valid Outliers); cập nhật đồng bộ [tieu_luan_prj35.pdf](<tieu_luan_prj35.pdf>) và tieu_luan_prj35.py (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/tieu_luan_prj35.py`; chưa kiểm chứng lại).
- **Nội dung đã hoàn thành:**
  - Kiểm toán Bảng chính thô (CSV1): Phân cách dấu chấm phẩy (;), toàn bộ 9 cột nạp dạng chuỗi (object), thống kê khuyết thiếu trực tiếp ban đầu (Date khuyết 17.01%, Time khuyết 11.93%, Sub_metering_1 khuyết 17.40%, Voltage khuyết 13.29%, Active Power khuyết 5.58%); phát hiện 5 nhóm dị tật thực tế (tạp chất đơn vị USD/kg/%/VND/đ, dấu phẩy thập phân, chuỗi dị biệt ?, -, null, N/A, mã lỗi sentinel 9999, giá trị âm -1, -16.0). Phân công bạn Triệu Hoàng Lan Anh phụ trách làm sạch độc lập tệp này song song.
  - Kiểm toán Bảng phụ thô (CSV2): Chỉ ra 2 dòng metadata Open-Meteo và định dạng chuỗi toàn bộ; lập bảng tỷ lệ khuyết thiếu thực tế (cột `time` khuyết 11.26%, nhiệt độ khuyết 5.37%, độ ẩm khuyết 5.79%, điểm sương khuyết 9.21%, gió khuyết 11.68%, mưa khuyết 9.02%).
  - Kiểm định biên độ vật lý bảng phụ: Độ ẩm [23%, 100%], nhiệt độ [-15°C, 35.4°C], gió [0, 51.7 km/h], mưa [0, 7.2 mm] — bản ghi ban đầu kết luận không có ngoại lai do hỏng cảm biến. **Đính chính:** min/max trong khoảng này chỉ mô tả những giá trị đọc được; không đủ để xác minh cảm biến hoặc loại trừ lỗi dữ liệu.
  - Cập nhật mục 1.4 vào [tieu_luan_prj35.qmd](<tieu_luan_prj35.qmd>) và biên dịch ra [tieu_luan_prj35.pdf](<tieu_luan_prj35.pdf>).
  - Viết và chạy hàm `kiem_toan_do_sach()` trong tieu_luan_prj35.py (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/tieu_luan_prj35.py`; chưa kiểm chứng lại).
- **Quyết định kỹ thuật:**
  - Giữ nguyên các giá trị công suất đỉnh trong CSV1 vì đây là tín hiệu quan trọng của phụ tải đỉnh trong kinh tế năng lượng.
  - Bản ghi ban đầu nêu có thể tái lập 100% cột `time` bằng `pd.date_range`. **Đính chính:** chỉ có thể gán lưới giờ dưới giả định không mất/đảo dòng; mốc thô không đọc được chưa có căn cứ xác minh thời điểm thật.
- **Tồn đọng & Bước tiếp theo:** Người dùng duyệt Bước 1.4; chuẩn bị tiến hành Bước 1.5: Xác định tối thiểu 3 câu hỏi kinh doanh thực tế cam kết giải quyết bằng Python.

---

## [2026-10-19 01:10] - Hoàn thành Bước 1.3: Đơn vị Quan sát & Cỡ mẫu; Xuất Báo cáo PDF & Mã nguồn Python Đồng bộ
- **Môi trường:** Windows 11, Quarto CLI 1.10 (Typst), Python 3.13, Pandas 2.x
- **Mục tiêu phiên:** Hoàn thành Bước 1.3 (Đơn vị quan sát & Cỡ mẫu cho Bảng chính CSV1 và Bảng phụ CSV2); cập nhật và biên dịch đồng bộ tệp Báo cáo PDF [tieu_luan_prj35.pdf](<tieu_luan_prj35.pdf>) cùng tệp mã nguồn tieu_luan_prj35.py (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/tieu_luan_prj35.py`; chưa kiểm chứng lại).
- **Nội dung đã hoàn thành:**
  - Phân tích chi tiết đơn vị quan sát: Bảng chính đo ở tần suất 1 phút/hộ gia đình (phản ánh hành vi bật/tắt thiết bị tức thời), Bảng phụ đo ở tần suất 1 giờ/vị trí dữ liệu thời tiết Paris (đính chính cách gọi cũ “trạm khí tượng”: metadata chưa xác nhận một trạm quan trắc cụ thể).
  - Lập bảng đối chiếu cỡ mẫu: Bảng chính thô gồm 2.075.259 dòng x 9 cột (phân cách ';', Date và Time tách rời); Bảng phụ thô gồm 34.608 dòng x 6 cột (bỏ qua 2 dòng metadata Open-Meteo).
  - Biện luận toán học về sự tương thích cỡ mẫu khi chuyển đổi đa quy mô (Downsampling Bảng chính từ 1 phút sang 1 giờ thu về ~34.600 dòng để ghép 1-1 với Bảng phụ).
  - Bổ sung nội dung vào [tieu_luan_prj35.qmd](<tieu_luan_prj35.qmd>) và biên dịch ra [tieu_luan_prj35.pdf](<tieu_luan_prj35.pdf>).
  - Cập nhật hàm kiểm tra cỡ mẫu trong tieu_luan_prj35.py (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/tieu_luan_prj35.py`; chưa kiểm chứng lại) và chạy xác thực thành công.
- **Quyết định kỹ thuật:**
  - File CSV2 thô chứa 2 dòng metadata ban đầu (`latitude, longitude,...`), do đó sử dụng `skiprows=2` để đọc đúng cấu trúc cột và 34.608 dòng quan sát.
  - Cấu hình môi trường `PYTHONUTF8=1` để Python hiển thị tiếng Việt trên terminal Windows mà không cần bọc code phức tạp trong file nguồn.
- **Tồn đọng & Bước tiếp theo:** Người dùng duyệt Bước 1.3; chuẩn bị tiến hành Bước 1.4: Kiểm toán độ sạch ban đầu & Biện luận ngoại lai.

---

## [2026-10-18 22:15] - Đọc và phân tích Cheat Sheet quy trình EDA 9 bước cho Tiểu luận PRJ-35
- **Môi trường:** Windows 11, Python 3.13, PowerShell
- **Mục tiêu phiên:** Đọc và đối chiếu Cheat Sheet quy trình EDA 9 bước (image.png (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/image.png`; chưa kiểm chứng lại)) với đề bài tiểu luận PRJ-35 ([projects.qmd](<projects.qmd>)); giữ nguyên thực trạng workspace và kích hoạt cơ chế tự động lưu nhật ký theo từng bước nhỏ.
- **Nội dung đã hoàn thành:**
  - Phân tích chi tiết 9 bước EDA chuẩn mực trong Cheat Sheet: (1) Data Overview, (2) Missing Values, (3) Univariate Analysis, (4) Bivariate Analysis, (5) Outlier Detection, (6) Correlation, (7) Distribution & Skewness, (8) Feature Relationships / Time Cycles, (9) EDA Workflow & Insights.
  - Đối chiếu bộ dữ liệu thực tế được giao của nhóm: [26_2521001040_Triệu Hoàng Lan Anh_CSV1.csv](<data/26_2521001040_Triệu Hoàng Lan Anh_CSV1.csv>) (Điện năng tiêu thụ phút) và [26_2521001040_Triệu Hoàng Lan Anh_CSV2.csv](<data/26_2521001040_Triệu Hoàng Lan Anh_CSV2.csv>) (Thời tiết Paris theo giờ).
  - Thu dọn các tệp tạm, khôi phục nguyên vẹn hiện trạng thư mục `tieuluan` trước khi thực thi.
- **Quyết định kỹ thuật & Quy ước làm việc:**
  - **Tự động lưu nhật ký:** Bãi bỏ quy ước phải gõ lệnh `+luu`; từ phiên này hệ thống tự động ghi nhật ký vào cả ba tệp nhật ký sau mỗi bước nhỏ hoàn thành.
  - **Triển khai bước nhỏ (Micro-steps):** Chia nhỏ 9 bước EDA thành từng thao tác cụ thể, trình bày rõ ràng để người dùng cùng rà soát trước khi chuyển bước tiếp theo.
- **Tồn đọng & Bước tiếp theo:** Tiến hành Bước 1 (Data Overview) trên dữ liệu phụ tải điện và thời tiết, kiểm tra `shape`, `head`, `info` và `describe`.

---

## [2026-10-13 20:03] - Đọc quy trình tiểu luận và tinh gọn dữ liệu PRJ-35
- **Môi trường:** Windows 11, Python 3.13, PowerShell
- **Mục tiêu phiên:** Đọc toàn bộ tài liệu trong `tieuluan`, nắm quy trình PRJ-35, giữ bộ dữ liệu cần thiết và xóa dữ liệu của đề tài cũ.
- **Nội dung đã hoàn thành:**
  - Đọc hướng dẫn dự án, nhật ký, Quarto và trích xuất/đối chiếu hai PDF; xác định `projects.qmd` và `projects (1).pdf` là bản mới hơn, bản `projects.pdf` cũ hơn.
  - Kiểm tra toàn bộ dữ liệu điện: 2.075.259 dòng, 9 cột, 1.442 ngày, 25.979 dòng có giá trị khuyết; household_power_consumption.txt (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/data/raw/household_power_consumption.txt`; chưa kiểm chứng lại).
  - Tải lịch ngày lễ quốc gia Pháp, chuẩn hóa 44 sự kiện trong kỳ dữ liệu thành 43 ngày duy nhất để ghép không nhân bản dòng; french_public_holidays_power_period.csv (đường dẫn lịch sử: `file:///c:/mypy/tieuluan/data/raw/french_public_holidays_power_period.csv`; chưa kiểm chứng lại).
  - Xóa bốn dữ liệu thừa của PRJ-15/chuỗi cung ứng/access logs khỏi `tieuluan/data/raw/`.
- **Quyết định kỹ thuật:** Dùng lịch ngày lễ làm bảng phụ theo lựa chọn B trong lộ trình; gộp sự kiện trùng ngày 2008-05-01; coi cả `?` và ô trống là missing; tạo khóa ngày trên bảng phút và ghép trước khi resample, giữ cỡ mẫu trên 100k.
- **Tồn đọng & Bước tiếp theo:** Tạo notebook thu thập dữ liệu; làm sạch missing values, ghép lịch lễ vào dữ liệu phút để giữ hơn 100k dòng, sau đó resample theo giờ/ngày và kiểm tra kích thước/bộ nhớ.
