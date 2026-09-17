# Xom Data · Join two record lists by id
# Problem: https://xomdata.com/practice/py-join-records
# Solved: 2026-09-17

def join_by_id(orders, customers):
    orders_customers = []
    for i in orders:
        for j in customers:
            if i['customer_id'] in j.values(): orders_customers.append({'name':j['name'], 'amount': i['amount']})
    return orders_customers
