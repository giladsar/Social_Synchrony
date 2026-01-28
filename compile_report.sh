#!/bin/bash

# Script to compile the Final Report LaTeX document

echo "================================================"
echo "Compiling Final Report for Social Synchrony"
echo "================================================"
echo ""

# Check if LaTeX is installed
if ! command -v pdflatex &> /dev/null
then
    echo "❌ Error: pdflatex not found!"
    echo ""
    echo "Please install LaTeX:"
    echo "  Ubuntu/Debian: sudo apt-get install texlive-full"
    echo "  macOS: brew install --cask mactex"
    echo "  Windows: Download from https://miktex.org/"
    echo ""
    exit 1
fi

echo "✅ LaTeX found: $(which pdflatex)"
echo ""

# Check if the .tex file exists
if [ ! -f "Final_Report.tex" ]; then
    echo "❌ Error: Final_Report.tex not found!"
    echo "Please ensure you're in the correct directory."
    exit 1
fi

echo "📄 Compiling Final_Report.tex..."
echo ""

# First compilation
echo "🔄 First pass..."
pdflatex -interaction=nonstopmode Final_Report.tex > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed on first pass!"
    echo "Check Final_Report.log for details."
    exit 1
fi

echo "✅ First pass complete"

# Second compilation (for references and cross-references)
echo "🔄 Second pass (resolving references)..."
pdflatex -interaction=nonstopmode Final_Report.tex > /dev/null 2>&1

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed on second pass!"
    echo "Check Final_Report.log for details."
    exit 1
fi

echo "✅ Second pass complete"
echo ""

# Check if PDF was created
if [ -f "Final_Report.pdf" ]; then
    echo "================================================"
    echo "✅ SUCCESS! PDF generated: Final_Report.pdf"
    echo "================================================"
    echo ""
    
    # Get file size
    if command -v du &> /dev/null; then
        SIZE=$(du -h Final_Report.pdf | cut -f1)
        echo "📊 File size: $SIZE"
    fi
    
    # Get page count if pdfinfo is available
    if command -v pdfinfo &> /dev/null; then
        PAGES=$(pdfinfo Final_Report.pdf | grep Pages | awk '{print $2}')
        echo "📄 Page count: $PAGES pages"
    fi
    
    echo ""
    echo "Next steps:"
    echo "  1. Open Final_Report.pdf to review"
    echo "  2. Verify all sections are present"
    echo "  3. Check that images are displayed correctly"
    echo "  4. Upload to Google Drive for submission"
    echo ""
    
    # Clean up auxiliary files (optional)
    read -p "Clean up auxiliary files (.aux, .log, .out)? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -f Final_Report.aux Final_Report.log Final_Report.out Final_Report.toc
        echo "✅ Cleaned up auxiliary files"
    fi
else
    echo "❌ Error: PDF was not generated!"
    echo "Check Final_Report.log for details."
    exit 1
fi
