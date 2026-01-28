# Social Synchrony Project - Quick Reference Guide

This guide provides a quick overview of the Social Synchrony project, its structure, and how to use it for academic purposes.

## Project Overview

**Purpose**: Automated analysis of social synchrony in dyadic interactions using computer vision and pose estimation.

**Key Technology**: YOLO11n-pose model for real-time human pose estimation

**Main Output**: Quantitative metrics of interpersonal coordination including cross-correlation and co-crossing events

## File Structure

### Core Files

| File | Purpose | Usage |
|------|---------|-------|
| `Social_Synchrony.ipynb` | Main analysis notebook | Run cells sequentially to analyze videos |
| `Final_Report.tex` | Academic report (LaTeX) | Compile to PDF for submission |
| `README.md` | Project documentation | Overview and setup instructions |
| `REPORT_README.md` | Report guide | Instructions for compiling the report |

### Utility Files

| File | Purpose |
|------|---------|
| `compile_report.sh` | Bash script to compile LaTeX report |
| `Makefile` | Alternative compilation using make |
| `.gitignore` | Git ignore rules (includes LaTeX aux files) |

### Directories

| Directory | Contents |
|-----------|----------|
| `data_output/` | Generated visualizations and results |
| `images/` | Input video files |

## Workflow

### 1. Setup Environment

```bash
# Install dependencies
pip install torch numpy opencv-python ultralytics matplotlib scipy

# Clone repository
git clone https://github.com/giladsar/Social_Synchrony.git
cd Social_Synchrony
```

### 2. Run Analysis

```bash
# Open Jupyter notebook
jupyter notebook Social_Synchrony.ipynb

# Run all cells sequentially (Cell > Run All)
```

### 3. Generate Report

```bash
# Option 1: Using bash script
./compile_report.sh

# Option 2: Using make
make

# Option 3: Manual compilation
pdflatex Final_Report.tex
pdflatex Final_Report.tex  # Run twice for references
```

### 4. Review Outputs

- **PDF Report**: `Final_Report.pdf` (~8 pages)
- **Visualizations**: `data_output/*.png`
- **Notebook Results**: Displayed inline in Jupyter

## Key Concepts

### Social Synchrony

Temporal coordination of behaviors between individuals during social interactions. Measured through:

1. **Cross-Correlation**: Statistical similarity between movement signals
2. **Co-Crossing Events**: Simultaneous changes in movement states

### Pipeline Stages

1. **Pose Estimation**: Extract 17 body keypoints per person per frame
2. **Identity Tracking**: Maintain consistent labels across frames
3. **Preprocessing**: Clean, interpolate, and smooth pose data
4. **Signal Processing**: Compute velocity and movement metrics
5. **Synchrony Analysis**: Calculate correlation and co-crossing metrics

### Data Format

- **Input**: MP4 video file with 2 people
- **Frame Rate**: ~25 FPS
- **Keypoints**: 17 COCO format joints (nose, eyes, ears, shoulders, elbows, wrists, hips, knees, ankles)
- **Output**: Time series of movement velocities and synchrony scores

## Notebook Structure

The Jupyter notebook is organized into these sections:

### Section 1: Environment Setup (Cells 1-3)
- Verify dependencies and GPU/MPS availability
- Define helper functions for visualization

### Section 2: Model Initialization (Cell 4)
- Load YOLO11n-pose model

### Section 3: Video Processing (Cells 5-7)
- Load video file
- Extract and preprocess frames
- Apply sharpening for better detection

### Section 4: Pose Estimation (Cells 8-10)
- Run YOLO inference on all frames
- Extract keypoint coordinates and confidence scores

### Section 5: Identity Tracking (Cells 11-13)
- Implement IoU-based tracking
- Assign consistent IDs to Person 1 and Person 2

### Section 6: Data Preprocessing (Cells 14-18)
- Handle missing data (NaN interpolation)
- Apply confidence masking
- Smooth trajectories with Gaussian filter

### Section 7: Movement Analysis (Cells 19-22)
- Calculate frame-to-frame velocity
- Compute movement magnitude
- Generate time series

### Section 8: Synchrony Metrics (Cells 23-30)
- Cross-correlation analysis
- Co-crossing event detection
- Statistical testing

## Key Functions

### Visualization
```python
show_image(img_or_list, row_plot=1, titles=None)
# Display one or multiple images in a grid
```

### Velocity Calculation
```python
velocity_magnitude(keypoints)
# Compute movement velocity from joint positions
```

### Cross-Correlation
```python
correlate(signal1, signal2, mode='full')
# Measure temporal synchrony between signals
```

### Event Detection
```python
hysteresis_crossing(signal, threshold_up, threshold_down)
# Detect state changes with hysteresis
```

## Metrics Explained

### Cross-Correlation Coefficient (r)

**Range**: -1 to +1

**Interpretation**:
- `r > 0.7`: Strong synchrony
- `r = 0.3-0.7`: Moderate synchrony
- `r < 0.3`: Weak synchrony

**Zero-Lag**: Simultaneous coordination
**Lagged**: Leader-follower dynamics

### Co-Crossing Ratio

**Formula**: (Co-crossing events) / (Total crossing events)

**Range**: 0 to 1

**Interpretation**:
- High ratio: Frequent coordinated movement changes
- Low ratio: Independent movement patterns

## Common Tasks

### Change Video File

Edit the video path in the notebook:
```python
video_path = './images/YOUR_VIDEO.mp4'
```

### Adjust Smoothing

Modify Gaussian smoothing parameters:
```python
# More smoothing (reduce noise)
gaussian_filter1d(data, sigma=5)

# Less smoothing (preserve detail)
gaussian_filter1d(data, sigma=2)
```

### Modify Threshold

Change co-crossing detection threshold:
```python
threshold = np.median(velocity)  # Current
threshold = np.mean(velocity)     # Alternative
threshold = 0.5                   # Fixed value
```

### Export Data

Save results to CSV:
```python
import pandas as pd
df = pd.DataFrame({
    'frame': range(len(velocity1)),
    'person1_velocity': velocity1,
    'person2_velocity': velocity2
})
df.to_csv('data_output/velocities.csv', index=False)
```

## Troubleshooting

### Issue: "No module named 'ultralytics'"
**Solution**: Install package
```bash
pip install ultralytics
```

### Issue: "Video file not found"
**Solution**: Check video path and ensure file exists in `images/` directory

### Issue: "CUDA out of memory"
**Solution**: Process video in batches or use CPU
```python
model = YOLO('yolo11n-pose.pt')  # Uses CPU by default
```

### Issue: "LaTeX compilation failed"
**Solution**: 
1. Check that all images exist in `data_output/`
2. Ensure LaTeX distribution is installed
3. Review `.log` file for specific errors

### Issue: "Empty tracking results"
**Solution**: 
1. Verify video contains visible people
2. Adjust confidence threshold
3. Check video format compatibility

## Performance Tips

### Speed Up Processing

1. **Use GPU/MPS**: Automatic if available
2. **Reduce Frame Rate**: Process every Nth frame
3. **Lower Resolution**: Resize frames before processing
4. **Smaller Model**: Use yolo11n-pose (nano) instead of larger variants

### Improve Accuracy

1. **Frame Sharpening**: Already implemented
2. **Higher Confidence**: Increase threshold to filter unreliable detections
3. **Better Video Quality**: Use high-resolution, well-lit videos
4. **Proper Camera Angle**: Ensure subjects are fully visible

## Citation

If you use this code in your research, please cite:

```
Sar, G. (2026). Social Synchrony Analysis Using YOLO Pose Estimation.
GitHub repository: https://github.com/giladsar/Social_Synchrony
```

## Academic Requirements Checklist

For final submission, ensure:

- [ ] Report PDF generated (`Final_Report.pdf`)
- [ ] All sections present (9 required sections)
- [ ] Sample images included in report
- [ ] Bibliography has 10+ references
- [ ] Code is well-documented with comments
- [ ] Notebook has markdown cells explaining methodology
- [ ] Formatting: 11pt font, 1.5 line spacing
- [ ] Page count: ~8 pages (excluding appendices)
- [ ] Supplementary materials attached (notebook + code)

## Support

For questions or issues:
- **GitHub Issues**: https://github.com/giladsar/Social_Synchrony/issues
- **Repository Owner**: Gilad Sar (@giladsar)

## License

Currently unlicensed. Contact repository owner for usage permissions.

---

Last Updated: January 28, 2026
