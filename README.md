# Social Synchrony

A computer vision project leveraging YOLO pose estimation models to analyze social synchrony through video analysis and body movement tracking.

## 📋 Overview

Social Synchrony is a research-oriented tool that uses state-of-the-art pose estimation technology to detect and analyze body movements in videos. By utilizing the YOLO (You Only Look Once) model family, this project aims to quantify and visualize social synchrony patterns in human interactions.

## 🎯 Project Goals

- Perform robust pose estimation on video data using YOLO models
- Analyze temporal patterns of body movements across multiple individuals
- Quantify social synchrony metrics for research applications
- Provide visualizations of pose tracking and movement analysis

## 🚀 Features

- **Video-Based Pose Estimation**: Process video files to extract keypoint coordinates for human poses
- **Multi-Person Tracking**: Track multiple individuals simultaneously
- **Movement Analysis**: Analyze temporal patterns and synchrony between individuals
- **Visualization Tools**: Helper functions for displaying results and tracking data
- **Data Export**: Output analyzed data for further statistical analysis

## 🛠️ Technologies

- **Python 3.x**: Primary programming language
- **YOLOv8** (Ultralytics): Advanced pose estimation model
- **PyTorch**: Deep learning framework with MPS/GPU support
- **OpenCV**: Video processing and computer vision operations
- **NumPy**:  Numerical computing and array operations
- **Matplotlib**: Data visualization

## 📦 Installation

### Prerequisites

- Python 3.8 or higher
- pip package manager

### Setup

1. Clone the repository:
```bash
git clone https://github.com/giladsar/Social_Synchrony.git
cd Social_Synchrony
```

2. Install required dependencies:
```bash
pip install torch numpy opencv-python ultralytics matplotlib
```

### Recommended Versions

- NumPy: 1.26.x
- OpenCV: 4.10.x
- Ultralytics: 8.2.0+
- PyTorch: Latest stable version

## 📊 Usage

Open the Jupyter notebook to explore the analysis pipeline: 

```bash
jupyter notebook Social_Synchrony.ipynb
```

The notebook includes:
1. Environment setup and dependency verification
2. Helper functions for visualization
3. YOLO model initialization and configuration
4. Video processing pipeline
5. Pose estimation and tracking
6.  Synchrony analysis and metrics

## 📁 Project Structure

```
Social_Synchrony/
├── Social_Synchrony.ipynb    # Main analysis notebook
├── data_output/               # Output data and results
├── images/                    # Sample images and visualizations
├── . gitignore                # Git ignore rules
└── . gitattributes            # Git attributes configuration
```

## 🔬 Methodology

This project transitions from traditional MPI heatmap-approach models to the more efficient and accurate YOLO architecture, which provides: 

- Better performance on video data
- Real-time processing capabilities
- Improved multi-person pose detection
- More robust keypoint tracking

## 🖥️ Hardware Support

The project supports multiple compute backends:
- **CPU**: Works on any system
- **GPU (CUDA)**: For NVIDIA GPUs
- **MPS (Metal)**: For Apple Silicon (M1/M2) acceleration

## 📈 Output

Analysis results are saved to the `data_output/` directory and include:
- Pose keypoint coordinates over time
- Tracking data for multiple individuals
- Synchrony metrics and statistics
- Visualization frames and plots

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests. 

## 📄 License

This project is currently unlicensed. Please contact the repository owner for usage permissions.

## 👤 Author

**Gilad Sar** - [@giladsar](https://github.com/giladsar)

## 🙏 Acknowledgments

- [Ultralytics YOLOv8](https://github.com/ultralytics/ultralytics) for the pose estimation model
- OpenCV community for computer vision tools
- PyTorch team for the deep learning framework

---

*For questions or collaboration inquiries, please open an issue on GitHub.*
