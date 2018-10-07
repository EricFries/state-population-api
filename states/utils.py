from decimal import Decimal, ROUND_DOWN


def quantize_decimal(raw_decimal, precision='.01', rounding_option=ROUND_DOWN):
    return raw_decimal.quantize(Decimal(precision), rounding_option)
