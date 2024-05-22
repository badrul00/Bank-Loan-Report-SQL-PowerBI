--Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Application FROM bank_loan_data

--Month to Date Loan Applications
SELECT COUNT(id) AS MTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) =2021

--Previous Month to Date Loan Applications
SELECT COUNT(id) AS MTD_Total_Loan_Application FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) =2021


--Month to Date Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_received FROM bank_loan_data

--Month to Date Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Average Interest Rate
SELECT AVG(int_rate) * 100 AS Avg_Interest_Rate FROM bank_loan_data

--Average Interest Rate ROUND(2)
SELECT ROUND(AVG(int_rate),2) * 100 AS Avg_Interest_Rate FROM bank_loan_data

--Average Interest Rate ROUND(4)
SELECT ROUND(AVG(int_rate),4) * 100 AS Avg_Interest_Rate FROM bank_loan_data

--Month to Date Average Interest Rate
SELECT ROUND(AVG(int_rate),4) * 100 AS Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Average Debt to Income Ratio
SELECT ROUND(AVG(dti),4) * 100 AS Avg_DTI FROM bank_loan_data

--Good Loan Percentage
SELECT
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
	/
	COUNT(id) AS Good_loan_percentage
FROM bank_loan_data

--Good Loan Application
SELECT COUNT(id) AS Good_Loan_Application FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Received Amount
SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Bad Loan Percentage
SELECT
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0)/
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data

--Bad Loan Application
SELECT COUNT(id) AS Bad_Loan_Application FROM bank_loan_data
WHERE loan_status =  'Charged Off'

--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Received Amount
SELECT SUM(total_payment) AS Bad_Loan_Amount_Received FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Loan Status Grid View
SELECT 
		loan_status,
		COUNT(id) AS Total_Application,
		SUM(total_payment) AS Total_Amount_Received,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate * 100) AS Interest_Rate,
		AVG(dti * 100) AS Debt_to_Income
	FROM
		bank_loan_data
	GROUP BY
		loan_status


--Month to Date Loan Status Grid View
SELECT 
		loan_status,
		SUM(total_payment) AS MTD_Total_Amount_Received,
		SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

--Record by Month
SELECT 
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--Record by Address State
SELECT 
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC

--Record by Term
SELECT 
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term

--Record by Employee Length
SELECT 
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

--Record by Loan Purpose
SELECT 
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

--Record by Home Ownership
SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC

--Record by Home Ownership by Grade
SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC

--Record by Home Ownership by Grade and Address State
SELECT 
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
WHERE grade = 'A' AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC





