# Makefile for compiling Final Report

# Main target
.PHONY: all
all: Final_Report.pdf

# Compile LaTeX to PDF
Final_Report.pdf: Final_Report.tex
	@echo "Compiling LaTeX document..."
	pdflatex -interaction=nonstopmode Final_Report.tex
	@echo "Second pass for references..."
	pdflatex -interaction=nonstopmode Final_Report.tex
	@echo "PDF generated successfully!"

# Clean auxiliary files
.PHONY: clean
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.synctex.gz *.fdb_latexmk *.fls
	@echo "Clean complete!"

# Clean everything including PDF
.PHONY: clean-all
clean-all: clean
	@echo "Removing PDF..."
	rm -f Final_Report.pdf
	@echo "All clean!"

# Display help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all        - Compile the Final Report (default)"
	@echo "  clean      - Remove auxiliary LaTeX files"
	@echo "  clean-all  - Remove all generated files including PDF"
	@echo "  help       - Display this help message"
