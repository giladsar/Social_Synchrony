# Final Report Guide

This directory contains the final academic report for the Social Synchrony project.

## Report Structure

The report (`Final_Report.tex`) includes all required sections as specified in the project requirements:

### Required Sections ✓

1. **Cover Page** - Project title, team members, date, and course number
2. **Introduction** - Background, research motivation, and main objectives
3. **Dataset Description**
   - Examples of Data (sample images)
   - Data Characteristics (format, resolution, size, amount)
   - Data Acquisition (how/where obtained)
   - Data Access (links and references)
4. **Methods and Implementation** - Workflow, algorithms, and tools
5. **Results** - Findings, visuals, and quantitative outcomes
6. **Discussion** - Interpretation, significance, and limitations
7. **Conclusions** - Key outcomes and take-home messages
8. **Bibliography** - References with numbered citations (15 references)
9. **Supplementary Material** - Python code and supporting files

### Formatting Requirements ✓

- **Font size**: 11pt
- **Line spacing**: 1.5
- **Page count**: ~8 pages (excluding appendices)
- **Code**: Organized and readable with proper documentation

## Generating the PDF Report

### Prerequisites

You need a LaTeX distribution installed on your system:

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install texlive-full
```

#### macOS
```bash
brew install --cask mactex
```

#### Windows
Download and install [MiKTeX](https://miktex.org/download) or [TeX Live](https://www.tug.org/texlive/)

### Compilation

To compile the LaTeX document to PDF:

```bash
# Navigate to project directory
cd /path/to/Social_Synchrony

# Compile (run twice for proper references)
pdflatex Final_Report.tex
pdflatex Final_Report.tex

# Or use the convenience script
chmod +x compile_report.sh
./compile_report.sh
```

The compiled PDF will be named `Final_Report.pdf`.

### Alternative: Online LaTeX Editors

If you don't want to install LaTeX locally, you can use online editors:

1. **Overleaf** (https://www.overleaf.com/)
   - Upload `Final_Report.tex`
   - Upload images from `data_output/` directory
   - Click "Recompile" to generate PDF

2. **ShareLaTeX** (now part of Overleaf)

3. **Papeeria** (https://papeeria.com/)

## Customization

### Adding Team Members

Edit the author section in `Final_Report.tex`:

```latex
\author{
    Your Name 1 \\
    Your Name 2 \\
    Your Name 3 \\
    \\
    Course Number: [YOUR COURSE NUMBER] \\
    Date: [YOUR DATE]
}
```

### Adding Course Information

Replace `[TO BE FILLED]` with your actual course number in the document.

### Adding More Images

1. Save your images in the `data_output/` directory
2. Add them to the report using:

```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{data_output/your_image.png}
    \caption{Your caption here}
    \label{fig:your_label}
\end{figure}
```

### Modifying Bibliography

Add new references to the Bibliography section following the numbered format:

```latex
\item Author, A., \& Author, B. (Year). Title. \textit{Journal}, Volume(Issue), Pages.
```

## Directory Structure

```
Social_Synchrony/
├── Final_Report.tex          # Main report document
├── Final_Report.pdf          # Compiled PDF (after compilation)
├── REPORT_README.md          # This file
├── compile_report.sh         # Compilation script
├── Social_Synchrony.ipynb    # Main analysis notebook (supplementary material)
├── data_output/              # Output directory with figures
│   ├── annotated_frame_450.png
│   ├── original_frame_450.png
│   ├── sharpened_frame_450.png
│   └── filter-effect_frame_450.png
└── README.md                 # Project README
```

## Troubleshooting

### Missing Images Error

If you get errors about missing images:
1. Ensure all images referenced in the `.tex` file exist in `data_output/`
2. Check that image filenames match exactly (case-sensitive)
3. Run the Jupyter notebook to regenerate output images if needed

### LaTeX Compilation Errors

If compilation fails:
1. Check that all required LaTeX packages are installed
2. Run `pdflatex` twice to resolve cross-references
3. Check the `.log` file for specific error messages

### Package Not Found

If you get "package not found" errors:
```bash
# Ubuntu/Debian
sudo apt-get install texlive-latex-extra

# Or install full TeXLive distribution
sudo apt-get install texlive-full
```

## Submission

1. Compile the report to PDF using the instructions above
2. Review the PDF to ensure:
   - All sections are present
   - Images are displayed correctly
   - References are numbered properly
   - Formatting meets requirements (11pt font, 1.5 spacing)
3. Upload `Final_Report.pdf` to Google Drive as specified in the project requirements
4. Include a link to the GitHub repository for supplementary materials

## Quality Checklist

Before submission, verify:

- [ ] Cover page includes all required information
- [ ] All 9 required sections are present
- [ ] Sample images are displayed in Dataset Description
- [ ] Methods section clearly describes the workflow
- [ ] Results section includes findings and visuals
- [ ] Discussion interprets results and notes limitations
- [ ] Conclusions summarize key outcomes
- [ ] Bibliography has at least 10 references with proper formatting
- [ ] Supplementary Material section references the code
- [ ] Font size is 11pt
- [ ] Line spacing is 1.5
- [ ] Document is approximately 8 pages (excluding appendices)
- [ ] Code in notebook has markdown cells, headings, and comments
- [ ] All figures are properly captioned and referenced in text

## Additional Resources

- **LaTeX Tutorial**: https://www.overleaf.com/learn
- **YOLO Documentation**: https://docs.ultralytics.com/
- **Project Repository**: https://github.com/giladsar/Social_Synchrony

## Contact

For questions or issues with the report:
- Open an issue on GitHub: https://github.com/giladsar/Social_Synchrony/issues
- Contact: Gilad Sar (@giladsar)
