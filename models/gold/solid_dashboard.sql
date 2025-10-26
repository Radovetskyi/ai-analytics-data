SELECT status, amount, type, currency, processing_amount 
FROM {{ ref('solid') }}