import qrcode

# QR 코드에 포함할 데이터
data = "12345"  # QR 코드에 저장할 데이터

# QR 코드 생성
qr = qrcode.QRCode(
    version=1,  # QR 코드의 크기 (1: 가장 작음, 40: 가장 큼)
    error_correction=qrcode.constants.ERROR_CORRECT_L,  # 오류 수정 수준
    box_size=10,  # 박스 크기
    border=4,  # 테두리 크기
)
qr.add_data(data)
qr.make(fit=True)

# QR 코드 이미지를 생성하고 저장
img = qr.make_image(fill_color="black", back_color="white")
img.save("qr_code.png")  # 파일 이름: qr_code.png
print("QR 코드가 생성되었습니다: qr_code.png")
