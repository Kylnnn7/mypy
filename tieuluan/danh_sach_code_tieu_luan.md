# Danh sách hàm và cú pháp dùng trong tiểu luận

Tệp này tổng hợp cú pháp xuất hiện trong `tieu_luan_prj35.ipynb`. Mỗi mục chỉ liệt kê **một lần**, sắp theo nhóm chủ đề; trong mỗi nhóm xếp theo bảng chữ cái để tra nhanh.

## Mục lục
- [Nạp thư viện](#nap-thu-vien)
- [Đọc và ghi dữ liệu](#doc-va-ghi-du-lieu)
- [Xem, chọn và sắp xếp](#xem-chon-va-sap-xep)
- [Thiếu dữ liệu và nội suy](#thieu-du-lieu-va-noi-suy)
- [Ngày giờ](#ngay-gio)
- [Điều kiện, ghép và nhóm](#dieu-kien-ghep-va-nhom)
- [Bộ nhớ và kiểu dữ liệu](#bo-nho-va-kieu-du-lieu)
- [NumPy và kiểm tra](#numpy-va-kiem-tra)
- [Cú pháp Python và chuỗi](#cu-phap-python-va-chuoi)
- [Tiền xử lý mô hình](#tien-xu-ly-mo-hinh)
- [Mô hình và chỉ số](#mo-hinh-va-chi-so)
- [Kiểm định thống kê](#kiem-dinh-thong-ke)
- [Đo hiệu năng](#do-hieu-nang)
- [Vẽ biểu đồ](#ve-bieu-do)
- [Hàm tự viết trong bài](#ham-tu-viet-trong-bai)

## Nạp thư viện

| Cú pháp | Công dụng |
|---|---|
| `from scipy import stats` | Nhập các công cụ phân phối xác suất và kiểm định thống kê. |
| `import numpy as np` | Nạp thư viện NumPy với tên viết tắt np. |
| `import pandas as pd` | Nạp thư viện Pandas và đặt tên viết tắt là `pd`. |

## Đọc và ghi dữ liệu

| Cú pháp | Công dụng |
|---|---|
| `"r"` trong `open()` | Mở file ở chế độ đọc. |
| `columns` trong `pd.read_parquet()` | Chỉ đọc các cột được chọn để giảm bộ nhớ. |
| `compression='snappy'` | Dùng cách nén Snappy khi ghi Parquet, không làm mất giá trị dữ liệu. |
| `encoding='utf-8'` | Đọc nội dung file theo bảng mã UTF-8, hỗ trợ tiếng Việt. |
| `engine='pyarrow'` | Chọn PyArrow làm thư viện hỗ trợ đọc và ghi Parquet. |
| `index=False` | Không ghi cột chỉ mục của DataFrame vào file CSV. |
| `index=False` trong `.to_parquet()` | Không lưu chỉ mục dòng vào file Parquet. |
| `index_label` | Đặt tên cột chỉ mục khi ghi CSV. |
| `keep_default_na=False` | Không tự chuyển danh sách ký hiệu thiếu mặc định khi đọc dữ liệu. |
| `low_memory=False` | Giúp Pandas suy luận kiểu dữ liệu trên toàn bộ dữ liệu thay vì từng phần nhỏ; có thể dùng nhiều bộ nhớ hơn. |
| `nrows` | Giới hạn số dòng dữ liệu cần đọc. |
| `parse_dates` | Chỉ định các cột cần đọc thành kiểu ngày giờ khi nạp CSV. |
| `pd.read_csv()` | Đọc file CSV thành bảng dữ liệu DataFrame. |
| `pd.read_parquet()` | Đọc file Parquet thành DataFrame. |
| `read_parquet(..., columns=[...])` | Đọc bảng ghép nhưng chỉ lấy các cột cần, giảm RAM và thời gian đọc. |
| `sep` | Chỉ định ký tự phân cách các cột trong file CSV. |
| `skiprows` | Bỏ qua số dòng đầu hoặc các dòng được chỉ định khi đọc file. |
| `.to_csv()` | Xuất bảng dữ liệu thành file CSV. |
| `.to_parquet()` | Lưu bảng vào định dạng Parquet, giữ kiểu dữ liệu của cột. |
| `usecols` | Chỉ đọc các cột được chọn từ file CSV để giảm dữ liệu nạp vào bộ nhớ. |
| `with open(...) as f` | Mở file để xử lý và tự động đóng khi kết thúc khối lệnh. |

## Xem, chọn và sắp xếp

| Cú pháp | Công dụng |
|---|---|
| `ascending=False` | Sắp xếp theo thứ tự giảm dần. |
| `.columns` | Lấy danh sách nhãn cột của bảng. |
| `.copy()` | Tạo bản sao của bảng hoặc cột. |
| `.describe()` | Tóm tắt số lượng, trung bình, độ lệch chuẩn, phân vị và biên độ dữ liệu. |
| `df['tên_cột']` | Chọn một cột theo tên. |
| `df['tên_cột'] = ...` | Tạo cột mới hoặc cập nhật giá trị của cột đã có. |
| `df[danh_sách_cột]` | Chọn nhiều cột theo thứ tự trong danh sách. |
| `.drop(columns=...)` | Bỏ các cột được chỉ định khỏi bảng kết quả. |
| `.dtypes` | Lấy kiểu dữ liệu của từng cột. |
| `.head()` | Xem một số dòng đầu của bảng hoặc Series. |
| `.iloc` | Chọn dòng hoặc cột theo vị trí số nguyên, bắt đầu từ 0. |
| `.iloc[-1]` | Lấy dòng hoặc phần tử cuối cùng. |
| `.iloc[0]` | Lấy dòng hoặc phần tử đầu tiên. |
| `.index` | Lấy chỉ mục dòng; sau khi đọc CSV theo cách mặc định, chỉ mục bắt đầu từ 0. |
| `is not None` | Kiểm tra đối tượng có giá trị trước khi sử dụng. |
| `.items()` | Duyệt từng cặp nhãn và giá trị của Series hoặc từng cặp khóa và giá trị của dictionary. |
| `len()` | Đếm số phần tử; với DataFrame, trả về số dòng. |
| `list()` | Chuyển một tập hợp có thể duyệt thành danh sách Python. |
| `.loc[điều_kiện, danh_sách_cột]` | Chọn các dòng thỏa điều kiện và các cột theo tên. |
| `None` | Biểu diễn việc không có giá trị; trong kết quả `.dt.tz`, cho biết dữ liệu chưa gắn múi giờ. |
| `.nunique()` | Đếm số giá trị khác nhau; mặc định bỏ qua giá trị thiếu. |
| `print()` | Hiển thị nội dung hoặc kết quả. |
| `.rename(columns=...)` | Đổi tên cột theo dictionary được cung cấp. |
| `.shape` | Trả về số dòng và số cột của bảng. |
| `.shape[0]` | Lấy số dòng của bảng. |
| `.shape[1]` | Lấy số cột của bảng. |
| `.sort_index()` | Sắp xếp dữ liệu theo nhãn chỉ mục; mặc định tăng dần. |
| `.sort_values()` | Sắp xếp các dòng theo giá trị một hoặc nhiều cột. |
| `.to_dict()` | Chuyển dữ liệu thành dictionary gồm các cặp khóa và giá trị. |
| `.to_string(index=False)` | Chuyển bảng thành chuỗi văn bản để in và ẩn chỉ mục dòng. |
| `.tolist()` | Chuyển mảng hoặc Series thành danh sách Python. |
| `.unique()` | Lấy các giá trị khác nhau, không lặp lại. |
| `.value_counts()` | Đếm số lần xuất hiện của từng giá trị; mặc định bỏ qua giá trị thiếu. |
| `zip()` | Duyệt đồng thời các danh sách tương ứng. |

## Thiếu dữ liệu và nội suy

| Cú pháp | Công dụng |
|---|---|
| `.bfill()` | Điền ô thiếu bằng giá trị hợp lệ gần nhất ở phía sau. |
| `.clip()` | Đưa giá trị vượt giới hạn về cận dưới hoặc cận trên tương ứng. |
| `.clip(0, 100)` | Đưa giá trị nhỏ hơn 0 về 0 và lớn hơn 100 về 100. |
| `.clip(lower=0)` | Đưa giá trị âm về 0. |
| `.dropna()` | Loại bỏ phần tử thiếu dữ liệu trong Series; với DataFrame, mặc định loại dòng chứa dữ liệu thiếu. |
| `.ffill()` | Điền ô thiếu bằng giá trị hợp lệ gần nhất ở phía trước. |
| `.fillna()` | Thay giá trị thiếu bằng giá trị được chỉ định. |
| `.interpolate(method='linear')` | Ước lượng các giá trị thiếu bằng nội suy tuyến tính theo vị trí giữa các giá trị đã biết. |
| `.isnull()` / `.isna()` | Xác định các ô thiếu dữ liệu, trả về giá trị đúng hoặc sai. |
| `method='time'` | Nội suy dựa trên khoảng cách thời gian của chỉ mục. |
| `NaT` | Biểu diễn giá trị thiếu của dữ liệu ngày giờ hoặc khoảng thời gian trong Pandas. |
| `.notna()` | Xác định các ô có dữ liệu. |

## Ngày giờ

| Cú pháp | Công dụng |
|---|---|
| `ambiguous='NaT'` | Đánh dấu giờ có hai cách hiểu khi kết thúc giờ mùa hè thành `NaT`. |
| `.asfreq('D')` | Giữ lịch liên tục theo ngày, thêm ngày thiếu bằng NaN. |
| `.asfreq('W-MON')` | Tạo lịch đều mỗi thứ Hai, giữ NaN cho tuần chưa có giá trị. |
| `.diff()` | Tính chênh lệch với phần tử ở dòng trước; với ngày giờ, trả về khoảng thời gian. |
| `.dt` | Truy cập các thuộc tính và phương thức ngày giờ của Series. |
| `.dt.dayofweek` | Lấy thứ trong tuần, thứ Hai là 0 và Chủ nhật là 6; cộng 2 tạo mã 2 đến 8 trong bảng D2, mã 8 là Chủ nhật. |
| `.dt.floor('D')` | Đưa mốc thời gian về đầu ngày chứa nó. |
| `.dt.floor('h')` | Đưa mỗi thời điểm về đầu giờ chứa nó, giữ nguyên số dòng. |
| `.dt.hour` | Lấy giờ trong ngày, từ 0 đến 23. |
| `.dt.month` | Lấy tháng trong năm, từ 1 đến 12. |
| `.dt.strftime()` | Chuyển ngày giờ thành chuỗi theo định dạng được chỉ định. |
| `.dt.tz` | Xem thông tin múi giờ của Series ngày giờ; trả về `None` nếu chưa có múi giờ. |
| `.dt.tz_localize()` | Gắn quy ước múi giờ cho các nhãn ngày giờ chưa có múi giờ mà không đổi giờ hiển thị. |
| `.duplicated()` | Đánh dấu các giá trị hoặc dòng trùng; mặc định giữ lần xuất hiện đầu tiên không bị đánh dấu. |
| `errors='coerce'` trong `pd.to_datetime()` | Chuyển giá trị không đọc được thành ngày giờ sang `NaT`. |
| `format` trong `pd.to_datetime()` | Chỉ định định dạng của chuỗi ngày giờ cần chuyển đổi. |
| `freq='1h'` | Quy định khoảng cách giữa hai mốc thời gian liên tiếp là một giờ. |
| `hours=1` | Chỉ định khoảng thời gian một giờ khi tạo `pd.Timedelta()`. |
| `.is_monotonic_increasing` | Kiểm tra dữ liệu có theo thứ tự tăng dần hoặc bằng nhau hay không. |
| `.is_unique` | Kiểm tra các giá trị không bị trùng. |
| `nonexistent='NaT'` | Đánh dấu giờ không tồn tại khi bắt đầu giờ mùa hè thành `NaT`. |
| `pd.date_range()` | Tạo một dãy mốc thời gian cách đều nhau. |
| `pd.Timedelta()` | Tạo một khoảng thời gian để tính toán hoặc so sánh các mốc ngày giờ. |
| `pd.to_datetime()` | Chuyển dữ liệu sang kiểu ngày giờ. |
| `pd.to_timedelta()` | Chuyển giá trị thành khoảng thời gian để cộng hoặc trừ với mốc ngày giờ. |
| `pd.to_timedelta(..., unit='D')` | Chuyển số ngày thành khoảng thời gian để cộng hoặc trừ với ngày tháng. |
| `unit='s'` | Quy định giá trị số đầu vào của `pd.to_timedelta()` được tính bằng giây. |

## Điều kiện, ghép và nhóm

| Cú pháp | Công dụng |
|---|---|
| `!=` | Kiểm tra hai giá trị có khác nhau hay không. |
| `&` | Kết hợp các điều kiện theo từng phần tử; đúng khi cả hai điều kiện cùng đúng. |
| `'count'` trong `.agg()` | Đếm các giá trị không thiếu trong mỗi nhóm. |
| `'mean'` trong `.agg()` | Tính trung bình các giá trị không thiếu trong mỗi nhóm. |
| `'sum' trong .agg()` | Cộng giá trị mỗi nhóm; với cờ Boolean là đếm số giá trị True. |
| `==` | Kiểm tra hai giá trị có bằng nhau hay không. |
| `>=` | Kiểm tra giá trị bên trái lớn hơn hoặc bằng giá trị bên phải. |
| `.abs()` / `abs()` | Lấy giá trị tuyệt đối; dạng có dấu chấm dùng trên Series, dạng không dấu chấm dùng cho số hoặc mảng. |
| `.agg()` | Tổng hợp các nhóm bằng các phép tính được chỉ định. |
| `.all()` | Kiểm tra tất cả giá trị boolean có đúng hay không; với DataFrame, mặc định kiểm tra theo từng cột. |
| `.all().all()` | Kiểm tra tất cả điều kiện trên toàn bộ bảng đều đúng. |
| `.between(0, 11)` | Kiểm tra giá trị thuộc đoạn từ 0 đến 11, gồm hai đầu. |
| `.corr()` | Tính tương quan giữa hai chuỗi theo các chỉ mục cùng có dữ liệu. |
| `.corr(method='pearson')` | Tính ma trận tương quan tuyến tính Pearson giữa các cột số; bỏ cặp có giá trị thiếu. |
| `.drop_duplicates('gio')` | Giữ một dòng cho mỗi giờ để tránh cộng lặp mưa giờ trong bảng phút. |
| `.eq()` | So sánh bằng theo từng phần tử. |
| `.equals()` | Kiểm tra hai bảng hoặc Series có cùng kích thước, thứ tự nhãn và dữ liệu tương ứng; kiểu dữ liệu của các cột cũng được xét. |
| `groupby('ngay').agg(...)` | Tổng hợp mức phút thành cấp ngày cho điện và năm biến thời tiết. |
| `.groupby('ngay')[...].ffill()` | Điền từ giá trị trước trong cùng ngày, không chuyển giá trị qua ngày khác. |
| `.groupby()` | Gom các dòng có cùng giá trị khóa để tính toán theo nhóm. |
| `how='left'` | Giữ toàn bộ các dòng bên trái và bổ sung dữ liệu phù hợp từ bảng bên phải. |
| `how='outer'` | Giữ các khóa có trong một trong hai bảng khi ghép. |
| `ignore_index=True` trong `pd.concat()` | Tạo lại chỉ mục liên tiếp khi ghép bảng kết quả. |
| `.index.equals()` | Kiểm tra hai bảng có cùng chỉ mục và thứ tự các dòng. |
| `indicator=True` | Thêm cột `_merge` cho biết dòng có ở cả hai bảng hay chỉ ở một bên. |
| `.isin()` | Kiểm tra từng giá trị có nằm trong tập giá trị được cung cấp hay không. |
| `.le(20)` | Kiểm tra giá trị nhỏ hơn hoặc bằng 20. |
| `.max()` / `max()` | Lấy giá trị lớn nhất. |
| `.mean()` | Tính giá trị trung bình. |
| `.median()` | Lấy trung vị các lượt đo. |
| `method='pearson'` | Chọn hệ số Pearson, nằm từ -1 đến 1 với các cặp biến có đủ dữ liệu và có biến thiên. |
| `.min()` | Lấy giá trị nhỏ nhất. |
| `min_periods=7` | Chỉ trả kết quả khi cửa sổ có đủ bảy giá trị không thiếu. |
| `on` | Chỉ định tên cột khóa chung dùng để ghép bảng. |
| `or` | Kết hợp hai điều kiện đơn; đúng khi ít nhất một điều kiện đúng. |
| `pd.concat()` | Nối các bảng hoặc Series; mặc định nối theo dòng. |
| `pd.merge()` | Ghép hai bảng dựa trên các khóa liên kết. |
| `.pivot()` | Đưa bảng kết quả về dạng hàng và cột để vẽ so sánh. |
| `.rename_axis()` | Đặt tên cho chỉ mục để tên đó trở thành tên cột khi dùng `reset_index()`. |
| `.rolling(7).mean()` | Tính trung bình trong cửa sổ bảy dòng liên tiếp. |
| `Series.add(..., fill_value=0)` | Cộng các thống kê theo chỉ mục, dùng 0 khi thiếu nhãn. |
| `.set_params()` | Thay cấu hình của bản sao mô hình dùng trong đối chứng. |
| `.shift(k)` | Dịch giá trị k vị trí; trên lịch tuần liên tục tương ứng k tuần. |
| `so_phut=('can_dien', 'size')` | Đặt tên cột kết quả, chọn cột nguồn và đếm số dòng mỗi nhóm. |
| `sort=False` trong `groupby()` | Giữ thứ tự nhóm theo lần xuất hiện thay vì sắp xếp tên nhóm. |
| `.sub(..., axis=0)` | Trừ theo nhãn hàng để tính sai số đúng ngày. |
| `.sum()` | Tính tổng; khi dùng trên kết quả kiểm tra thiếu dữ liệu, đếm số ô thiếu. |
| `validate='many_to_one'` | Kiểm tra khóa bên phải là duy nhất, cho phép nhiều dòng bên trái cùng ghép với một dòng bên phải. |
| `validate='one_to_one'` | Kiểm tra khóa ghép là duy nhất ở cả hai bảng. |
| `.where()` | Giữ giá trị thỏa điều kiện, thay giá trị không thỏa bằng NaN khi không chỉ định giá trị khác. |
| `|` | Kết hợp các điều kiện theo từng phần tử; đúng khi ít nhất một điều kiện đúng. |
| `~` | Đảo đúng thành sai và sai thành đúng khi áp dụng lên điều kiện dạng boolean. |

## Bộ nhớ và kiểu dữ liệu

| Cú pháp | Công dụng |
|---|---|
| `**` | Phép lũy thừa; chia số byte cho `1024 ** 2` để đổi sang MiB. |
| `astype('category')` | Chuyển nhãn lặp sang mã danh mục để giảm bộ nhớ khi thích hợp. |
| `.astype('float32')` | Chuyển sang số thực 32 bit, giảm bộ nhớ nhưng có thể gây sai số làm tròn. |
| `.astype('float64')` | Chuyển sang số thực 64 bit; không khôi phục phần chính xác đã mất khi chuyển xuống float32. |
| `chunksize` | Đọc CSV lần lượt theo số dòng mỗi phần. |
| `del` | Bỏ tham chiếu đến biến không còn dùng. |
| `errors='coerce'` | Chuyển giá trị không đổi được sang số thành giá trị thiếu `NaN`. |
| `.index.memory_usage(deep=True)` | Đo riêng bộ nhớ chỉ mục dòng. |
| `index=False` trong `memory_usage()` | Không tính bộ nhớ chỉ mục dòng. |
| `index=True` trong `memory_usage()` | Tính thêm bộ nhớ chỉ mục dòng. |
| `list.extend()` | Thêm các phần tử vào danh sách. |
| `memory_usage(deep=True)` | Đo bộ nhớ tính bằng byte, có tính nội dung các giá trị kiểu chuỗi/object. |
| `Path(...).stat().st_size` | Đọc kích thước tệp trên đĩa theo byte. |
| `pd.to_numeric()` | Chuyển dữ liệu sang kiểu số. |
| `.select_dtypes(include='float64')` | Chọn các cột có kiểu float64. |

## NumPy và kiểm tra

| Cú pháp | Công dụng |
|---|---|
| `assert` | Kiểm tra điều kiện bắt buộc và dừng thực hiện kèm thông báo nếu điều kiện sai. |
| `atol` | Đặt sai số tuyệt đối cho phép khi so sánh số. |
| `equal_nan=True` | Coi hai giá trị NaN cùng vị trí là khớp khi so sánh. |
| `np.abs()` | Lấy giá trị tuyệt đối. |
| `np.arange()` | Tạo dãy số theo bước nhảy, không gồm mốc dừng. |
| `np.isclose()` | So sánh hai mảng số với sai số tuyệt đối và tương đối cho phép. |
| `np.isfinite()` | Kiểm tra giá trị không phải NaN hoặc vô cực. |
| `np.nanmax()` | Lấy giá trị lớn nhất, bỏ qua NaN. |
| `np.sqrt((sai_so ** 2).mean())` | Tính RMSE, căn của trung bình bình phương sai số. |
| `rtol` | Đặt sai số tương đối cho phép khi so sánh số. |
| `.to_numpy()` | Chuyển dữ liệu Pandas thành mảng NumPy để tính theo vị trí. |

## Cú pháp Python và chuỗi

| Cú pháp | Công dụng |
|---|---|
| `"""..."""` | Viết chuỗi nhiều dòng; khi đặt đầu file hoặc đầu hàm, dùng làm phần mô tả. |
| `#` | Bắt đầu chú thích một dòng, không được thực thi như mã. |
| `%d`, `%m`, `%Y` | Ký hiệu ngày trong tháng, tháng và năm bốn chữ số trong định dạng thời gian. |
| `%H`, `%M`, `%S` | Ký hiệu giờ dạng 24 giờ, phút và giây trong định dạng thời gian. |
| `(...)` | Nhóm các phép tính hoặc điều kiện; cũng dùng để truyền tham số khi gọi hàm. |
| `+`, `-`, `*`, `/` | Thực hiện các phép cộng, trừ, nhân và chia; `+` còn nối chuỗi và `*` còn lặp chuỗi. |
| `25%`, `50%`, `75%` trong `.describe()` | Các phân vị; `50%` là trung vị. |
| `:,` /` | ,d`: Định dạng số có dấu phân tách hàng nghìn; `d` dùng cho số nguyên. |
| `:25s`,` | 28s`, `:24s`: Định dạng chuỗi với độ rộng tối thiểu để căn các cột khi in. |
| `:5.2f`,` | 6.1f`, `:6.2f`: Định dạng số thực với độ rộng tối thiểu và số chữ số sau dấu thập phân được chỉ định. |
| `:7,d` /` | 5,d`: Định dạng số nguyên với độ rộng tối thiểu và dấu phân tách hàng nghìn. |
| `<` / `>` | So sánh nhỏ hơn hoặc lớn hơn. |
| `=` | Gán giá trị cho biến. |
| `[...]` | Tạo danh sách hoặc chọn phần tử tùy vị trí sử dụng. |
| `[0]` | Lấy phần tử đầu tiên của danh sách hoặc bộ giá trị. |
| `[1:]` | Lấy từ phần tử có vị trí 1 đến hết; trong mã này dùng để bỏ tên cột đầu tiên. |
| `[1]` | Lấy phần tử thứ hai của danh sách hoặc bộ giá trị. |
| `[:4]` | Lấy tối đa 4 phần tử đầu tiên. |
| `[:6]` | Lấy tối đa 6 phần tử đầu tiên. |
| `[biểu_thức for ... in ...]` | Tạo danh sách bằng cách xử lý lần lượt từng phần tử. |
| `\n` | Chèn ký tự xuống dòng trong chuỗi. |
| `chuỗi_dữ_liệu[điều_kiện]` | Giữ lại các phần tử có điều kiện đúng. |
| `color`, `edgecolor` | Đặt màu phần tô và đường viền. |
| `count` trong kết quả `.describe()` | Số giá trị không thiếu được thống kê. |
| `def` | Khai báo một hàm. |
| `enumerate()` | Duyệt đồng thời vị trí và giá trị của từng phần tử, mặc định bắt đầu từ 0. |
| `enumerate(..., start=1)` | Đánh số lượt từ 1 khi duyệt. |
| `f"..."` | Chèn giá trị biến hoặc biểu thức vào chuỗi thông qua dấu ngoặc nhọn. |
| `for ... in ...` | Lặp lần lượt qua các phần tử. |
| `for col, count in ...` | Lấy hai thành phần của mỗi cặp và gán vào hai biến trong vòng lặp. |
| `ha`, `va` | Đặt căn ngang và căn dọc của chữ. |
| `if` | Chỉ thực hiện đoạn mã khi điều kiện đúng. |
| `if __name__ == '__main__'` | Chạy khối lệnh bên trong khi file Python được chạy trực tiếp; notebook đã thay phần này bằng các cell theo thứ tự. |
| `in` | Kiểm tra phần tử có thuộc một tập hợp hoặc danh sách hay không. |
| `.index.dayofweek`, `.index.month` | Lấy thứ và tháng từ chỉ mục ngày. |
| `int()` | Chuyển số về số nguyên; với số dương có phần thập phân thì bỏ phần thập phân. |
| `itertools`/vòng lặp cặp `(mô hình, so với)` | Duyệt mọi cặp cần so sánh. |
| `.low`, `.high` | Lấy cận dưới và cận trên của khoảng tin cậy. |
| `.lower()` | Chuyển chữ trong chuỗi thành chữ thường. |
| `marker`, `linestyle`, `linewidth` | Đặt dấu điểm, kiểu nét và độ dày đường. |
| `.mean_`, `.scale_` | Lấy trung bình và hệ số chia đã học của StandardScaler. |
| `pd.DataFrame()` | Tạo bảng dữ liệu từ danh sách, dictionary hoặc dữ liệu dạng bảng khác. |
| `r"..."` | Viết chuỗi giữ dấu gạch chéo ngược theo dạng nguyên bản, thường dùng cho đường dẫn Windows. |
| `return` | Kết thúc hàm và trả kết quả về nơi gọi. |
| `sharex=True`, `sharey=True` | Dùng chung thang trục giữa các vùng vẽ. |
| `.split(',')` | Biến thể có tham số của `.split()`: tách chuỗi tại dấu phẩy. |
| `std` trong kết quả `.describe()` | Độ lệch chuẩn mẫu, mô tả mức phân tán quanh trung bình. |
| `.str.startswith()` | Kiểm tra chuỗi trong từng dòng có bắt đầu bằng tiền tố chỉ định hay không. |
| `.strip()` | Bỏ khoảng trắng và ký tự xuống dòng ở hai đầu chuỗi. |
| `.upper()` | Chuyển tên tập thành chữ hoa để hiển thị tiêu đề. |
| `width`, `height` | Đặt bề rộng cột hoặc chiều cao thanh ngang. |
| `{k: ... for k in ...}` | Tạo từ điển bằng cách tính giá trị cho từng khóa. |
| `{khóa: giá_trị}` | Tạo dictionary lưu các cặp khóa và giá trị. |

## Tiền xử lý mô hình

| Cú pháp | Công dụng |
|---|---|
| `ColumnTransformer()` | Áp dụng cách biến đổi khác nhau cho từng nhóm cột. |
| `ddof=0` | Tính phương sai với mẫu số là số quan sát, phù hợp StandardScaler. |
| `drop='first'` | Bỏ mức đầu của mỗi nhóm làm mức tham chiếu. |
| `.fit_transform()` | Học thông số từ dữ liệu được truyền vào rồi biến đổi dữ liệu đó. |
| `.get_feature_names_out()` | Lấy tên các cột sau biến đổi. |
| `.named_steps` | Truy cập bước có tên trong Pipeline. |
| `.named_transformers_` | Truy cập bộ biến đổi đã học theo tên trong ColumnTransformer. |
| `OneHotEncoder()` | Chuyển nhãn phân loại thành các cột chỉ báo 0–1. |
| `Pipeline()` | Tổ chức các bước xử lý tuần tự trong cùng đối tượng. |
| `sparse_output=False` | Trả về mảng NumPy thường thay vì ma trận thưa. |
| `StandardScaler()` | Chuẩn hóa cột số bằng trung bình và độ lệch chuẩn học từ dữ liệu fit. |
| `.transform()` | Biến đổi bằng thông số đã học, không học lại. |

## Mô hình và chỉ số

| Cú pháp | Công dụng |
|---|---|
| `(sai_so / nhan).abs().mean() * 100` | Tính MAPE trên các hàng có mẫu số đủ lớn. |
| `1 - SSE / SST` | Tính R² từ tổng bình phương sai số và tổng bình phương độ lệch của nhãn quanh trung bình. |
| `clone()` | Sao chép cấu hình mô hình, không mang theo trạng thái đã huấn luyện. |
| `.coef_` | Lấy các hệ số đã học của mô hình hồi quy tuyến tính. |
| `.feature_importances_` | Lấy độ quan trọng dựa trên mức giảm sai số chia nhánh của rừng cây đã học. |
| `.fit(X_train, y_train)` | Học thông số tiền xử lý và hệ số mô hình trên dữ liệu train khi gọi qua Pipeline. |
| `.intercept_` | Lấy hệ số chặn của mô hình hồi quy tuyến tính. |
| `LinearRegression()` | Tạo mô hình hồi quy tuyến tính bình phương tối thiểu, có hệ số chặn mặc định. |
| `max_depth` | Giới hạn độ sâu mỗi cây. |
| `min_samples_leaf` | Đặt số mẫu tối thiểu ở mỗi lá. |
| `n_estimators` | Đặt số cây trong rừng. |
| `.predict(X_val)` | Áp dụng các bước đã học để dự báo nhãn cho đầu vào mới. |
| `random_state` | Cố định nguồn ngẫu nhiên để tái lập kết quả. |
| `RandomForestRegressor()` | Tạo mô hình kết hợp dự báo của nhiều cây hồi quy. |

## Kiểm định thống kê

| Cú pháp | Công dụng |
|---|---|
| `+=` | Cộng thêm vào giá trị hiện tại của biến. |
| `[:-k]` | Lấy phần mảng trừ k phần tử cuối, để ghép với phần cách k tuần. |
| `[k:]` | Lấy phần mảng từ vị trí k đến hết. |
| `.confidence_interval(confidence_level=0.95)` | Tính khoảng tin cậy 95% của chênh lệch trung bình theo t-test. |
| `.importances_mean` | Lấy trung bình mức thay đổi điểm qua các lần hoán vị. |
| `.importances_std` | Lấy độ lệch chuẩn giữa các lần hoán vị, không phải sai số chuẩn hay khoảng tin cậy. |
| `min(p * 3, 1)` | Hiệu chỉnh Bonferroni cho ba phép so sánh, giới hạn p-value tối đa bằng 1. |
| `n_repeats=10` | Lặp hoán vị mỗi cột mười lần. |
| `n_splits=3` | Đặt ba lượt chia thời gian. |
| `nan_policy='raise'` | Báo lỗi nếu dữ liệu kiểm định có giá trị thiếu. |
| `permutation_importance()` | Đo thay đổi điểm dự báo khi xáo trộn từng cột đầu vào của mô hình đã học. |
| `.pvalue` | Lấy p-value hai phía để so với mức ý nghĩa. |
| `scoring='neg_mean_absolute_error'` | Dùng âm MAE làm điểm; độ giảm điểm sau hoán vị tương ứng mức tăng MAE. |
| `.split()` | Trả về vị trí các dòng học và chấm của từng lượt. |
| `.statistic` | Lấy giá trị thống kê t. |
| `.statistic`, `.pvalue`, `.df` | Lấy thống kê kiểm định, p-value và bậc tự do từ kết quả. |
| `stats.norm.ppf()` | Lấy phân vị của phân phối chuẩn chuẩn hóa. |
| `stats.norm.sf()` | Tính xác suất phía bên phải của phân phối chuẩn chuẩn hóa. |
| `stats.ttest_rel()` | Thực hiện t-test cho hai nhóm quan sát ghép cặp. |
| `test_size=180` | Dành 180 dòng lịch ngày cho mỗi cửa sổ chấm trước khi lọc ngày đủ dữ liệu. |
| `TimeSeriesSplit()` | Chia các lượt học từ quá khứ và chấm trên giai đoạn sau, mở rộng tập học qua từng lượt. |
| `ttest_rel()` | Kiểm định t ghép cặp hai mẫu sai số theo ngày, dùng cho so sánh hai dự báo cùng gốc thời gian. |

## Đo hiệu năng

| Cú pháp | Công dụng |
|---|---|
| `'-c'` | Yêu cầu Python thực hiện đoạn mã được truyền vào. |
| `/ 1024**2` | Đổi số byte thành MiB. |
| `capture_output=True` | Thu kết quả và thông báo lỗi của tiến trình con. |
| `check=True` | Báo lỗi khi tiến trình con thất bại. |
| `json.dumps()` / `json.loads()` | Chuyển bảng thông tin đơn giản sang chuỗi JSON và đọc lại. |
| `perf_counter()` | Đọc đồng hồ độ phân giải cao để tính thời gian thực hiện. |
| `pickle.dumps()` / `pickle.loads()` | Đóng gói và khôi phục dữ liệu, mô hình nội bộ để truyền giữa hai tiến trình. |
| `psutil.Process().memory_info().peak_wset` | Lấy RAM vật lý đỉnh của toàn tiến trình trên Windows từ lúc khởi động. |
| `.stdout` | Lấy kết quả đầu ra của tiến trình con. |
| `subprocess.run()` | Chạy phép đo trong tiến trình riêng và chờ kết quả. |
| `sys.executable` | Lấy đường dẫn trình Python đang chạy notebook. |
| `sys.stdin.buffer.read()` | Đọc dữ liệu nhị phân được truyền vào tiến trình con. |
| `threadpool_limits(limits=1)` | Giới hạn thư viện tính toán dùng một luồng trong khối đo. |
| `with` | Áp dụng thiết lập trong một khối rồi khôi phục khi ra khỏi khối. |

## Hàm tự viết trong bài

| Cú pháp | Công dụng |
|---|---|
| `kiem_toan_do_sach()` | Kiểm tra dữ liệu thiếu, chuỗi không chuyển được thành số và giá trị bất thường trong file Python gốc. |
| `kiem_tra_co_mau()` | Kiểm tra kích thước và thông tin ban đầu của hai bảng trong file Python gốc. |
| `lam_sach_bang_phu()` | Làm sạch bảng thời tiết và lưu file CSV trong file Python gốc. |
| `tim_so_dong_metadata()` | Tìm vị trí dòng tên cột chứa `time` hoặc `date` để xác định số dòng đầu cần bỏ qua. |
| `dem_loi_tho()` | Đếm các vấn đề khi đọc thời gian và số đo trong bảng thô. |
| `.any(axis=1)` | Kiểm tra từng dòng có ít nhất một ô thỏa điều kiện. |
| `.apply(pd.to_numeric, errors='coerce')` | Đọc từng cột như số, đánh dấu giá trị không chuyển được là thiếu. |
| `xuat_csv()` | Ghi bảng dữ liệu biểu đồ vào thư mục dashboard_csv. |
| `encoding='utf-8-sig'` | Giúp Excel nhận đúng tiếng Việt khi mở CSV. |
| `.str.removeprefix()` | Bỏ tiền tố khỏi tên đặc trưng. |

## Ghi chú cách đọc

- Token có dấu chấm (`.head()`, `.agg()`) là phương thức của Pandas; token không dấu chấm (`len()`, `max()`) là hàm dựng sẵn của Python.
- Token có `...` nghĩa là chỗ đó nhận tham số, không phải ký hiệu cần gõ nguyên văn.
- Tham số chỉ dùng trong một biến thể (như `drop='first'`, `min_periods=7`) được ghi riêng để tra nhanh khi đọc code.
- Mục **Hàm tự viết trong bài** gom các hàm do tác giả viết, không có trong thư viện.
