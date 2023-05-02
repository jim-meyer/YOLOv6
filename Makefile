
download_yolov6_weights:
	mkdir -p weights
	cd weights && wget https://github.com/meituan/YOLOv6/releases/download/0.4.0/yolov6s.pt && wget https://github.com/meituan/YOLOv6/releases/download/0.4.0/yolov6m.pt
