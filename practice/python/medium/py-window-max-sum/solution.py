# Xom Data · Best k-day window by total
# Problem: https://xomdata.com/practice/py-window-max-sum
# Solved: 2026-09-20

def best_window(values, k):
    # Nếu danh sách ngắn hơn k ngày, không có quãng nào hợp lệ
    if len(values) < k:
        return None
    
    # Tính tổng cửa sổ đầu tiên (k phần tử đầu tiên)
    window_sum = sum(values[:k])
    max_sum = window_sum
    
    # Trượt cửa sổ qua các phần tử còn lại
    for i in range(k, len(values)):
        # Cập nhật tổng: trừ phần tử cũ đi, cộng phần tử mới vào
        window_sum += values[i] - values[i - k]
        # Cập nhật tổng lớn nhất
        if window_sum > max_sum:
            max_sum = window_sum
            
    return max_sum
