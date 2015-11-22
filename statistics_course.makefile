ALL_FIGURE_NAMES=$(shell cat statistics_course.figlist)
ALL_FIGURES=$(ALL_FIGURE_NAMES:%=%.pdf)

allimages: $(ALL_FIGURES)
	@echo All images exist now. Use make -B to re-generate them.

FORCEREMAKE:

include $(ALL_FIGURE_NAMES:%=%.dep)

%.dep:
	mkdir -p "$(dir $@)"
	touch "$@" # will be filled later.

img/pdf/introduction/statistics_purpose.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/introduction/statistics_purpose" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/introduction/statistics_purpose.pdf" "img/pdf/introduction/statistics_purpose.png"

img/pdf/introduction/statistics_purpose.pdf: img/pdf/introduction/statistics_purpose.md5
img/pdf/introduction/types_reasoning.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/introduction/types_reasoning" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/introduction/types_reasoning.pdf" "img/pdf/introduction/types_reasoning.png"

img/pdf/introduction/types_reasoning.pdf: img/pdf/introduction/types_reasoning.md5
img/pdf/introduction/sampling.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/introduction/sampling" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/introduction/sampling.pdf" "img/pdf/introduction/sampling.png"

img/pdf/introduction/sampling.pdf: img/pdf/introduction/sampling.md5
img/pdf/introduction/variable_types.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/introduction/variable_types" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/introduction/variable_types.pdf" "img/pdf/introduction/variable_types.png"

img/pdf/introduction/variable_types.pdf: img/pdf/introduction/variable_types.md5
img/pdf/introduction/variable_information.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/introduction/variable_information" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/introduction/variable_information.pdf" "img/pdf/introduction/variable_information.png"

img/pdf/introduction/variable_information.pdf: img/pdf/introduction/variable_information.md5
img/pdf/introduction/statistical_cycle.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/introduction/statistical_cycle" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/introduction/statistical_cycle.pdf" "img/pdf/introduction/statistical_cycle.png"

img/pdf/introduction/statistical_cycle.pdf: img/pdf/introduction/statistical_cycle.md5
img/pdf/descriptive/sample_classification.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/sample_classification" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/sample_classification.pdf" "img/pdf/descriptive/sample_classification.png"

img/pdf/descriptive/sample_classification.pdf: img/pdf/descriptive/sample_classification.md5
img/pdf/descriptive/frequency_count.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/frequency_count" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/frequency_count.pdf" "img/pdf/descriptive/frequency_count.png"

img/pdf/descriptive/frequency_count.pdf: img/pdf/descriptive/frequency_count.md5
img/pdf/descriptive/abs_freq_bar_chart.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/abs_freq_bar_chart" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/abs_freq_bar_chart.pdf" "img/pdf/descriptive/abs_freq_bar_chart.png"

img/pdf/descriptive/abs_freq_bar_chart.pdf: img/pdf/descriptive/abs_freq_bar_chart.md5
img/pdf/descriptive/abs_freq_bar_chart_polygon.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/abs_freq_bar_chart_polygon" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/abs_freq_bar_chart_polygon.pdf" "img/pdf/descriptive/abs_freq_bar_chart_polygon.png"

img/pdf/descriptive/abs_freq_bar_chart_polygon.pdf: img/pdf/descriptive/abs_freq_bar_chart_polygon.md5
img/pdf/descriptive/cum_abs_freq_bar_chart.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/cum_abs_freq_bar_chart" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/cum_abs_freq_bar_chart.pdf" "img/pdf/descriptive/cum_abs_freq_bar_chart.png"

img/pdf/descriptive/cum_abs_freq_bar_chart.pdf: img/pdf/descriptive/cum_abs_freq_bar_chart.md5
img/pdf/descriptive/cum_abs_freq_bar_chart_polygon.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/cum_abs_freq_bar_chart_polygon" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/cum_abs_freq_bar_chart_polygon.pdf" "img/pdf/descriptive/cum_abs_freq_bar_chart_polygon.png"

img/pdf/descriptive/cum_abs_freq_bar_chart_polygon.pdf: img/pdf/descriptive/cum_abs_freq_bar_chart_polygon.md5
img/pdf/descriptive/abs_freq_histogram.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/abs_freq_histogram" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/abs_freq_histogram.pdf" "img/pdf/descriptive/abs_freq_histogram.png"

img/pdf/descriptive/abs_freq_histogram.pdf: img/pdf/descriptive/abs_freq_histogram.md5
img/pdf/descriptive/abs_freq_histogram_polygon.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/abs_freq_histogram_polygon" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/abs_freq_histogram_polygon.pdf" "img/pdf/descriptive/abs_freq_histogram_polygon.png"

img/pdf/descriptive/abs_freq_histogram_polygon.pdf: img/pdf/descriptive/abs_freq_histogram_polygon.md5
img/pdf/descriptive/cum_abs_freq_histogram.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/cum_abs_freq_histogram" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/cum_abs_freq_histogram.pdf" "img/pdf/descriptive/cum_abs_freq_histogram.png"

img/pdf/descriptive/cum_abs_freq_histogram.pdf: img/pdf/descriptive/cum_abs_freq_histogram.md5
img/pdf/descriptive/cum_abs_freq_histogram_polygon.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/cum_abs_freq_histogram_polygon" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/cum_abs_freq_histogram_polygon.pdf" "img/pdf/descriptive/cum_abs_freq_histogram_polygon.png"

img/pdf/descriptive/cum_abs_freq_histogram_polygon.pdf: img/pdf/descriptive/cum_abs_freq_histogram_polygon.md5
img/pdf/descriptive/cum_rel_freq_histogram.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/cum_rel_freq_histogram" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/cum_rel_freq_histogram.pdf" "img/pdf/descriptive/cum_rel_freq_histogram.png"

img/pdf/descriptive/cum_rel_freq_histogram.pdf: img/pdf/descriptive/cum_rel_freq_histogram.md5
img/pdf/descriptive/cum_rel_freq_histogram_polygon.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/cum_rel_freq_histogram_polygon" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/cum_rel_freq_histogram_polygon.pdf" "img/pdf/descriptive/cum_rel_freq_histogram_polygon.png"

img/pdf/descriptive/cum_rel_freq_histogram_polygon.pdf: img/pdf/descriptive/cum_rel_freq_histogram_polygon.md5
img/pdf/descriptive/rel_freq_pie_chart.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/rel_freq_pie_chart" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/rel_freq_pie_chart.pdf" "img/pdf/descriptive/rel_freq_pie_chart.png"

img/pdf/descriptive/rel_freq_pie_chart.pdf: img/pdf/descriptive/rel_freq_pie_chart.md5
img/pdf/descriptive/median.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/median" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/median.pdf" "img/pdf/descriptive/median.png"

img/pdf/descriptive/median.pdf: img/pdf/descriptive/median.md5
img/pdf/descriptive/mode.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/mode" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/mode.pdf" "img/pdf/descriptive/mode.png"

img/pdf/descriptive/mode.pdf: img/pdf/descriptive/mode.md5
img/pdf/descriptive/quantiles.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/quantiles" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/quantiles.pdf" "img/pdf/descriptive/quantiles.png"

img/pdf/descriptive/quantiles.pdf: img/pdf/descriptive/quantiles.md5
img/pdf/descriptive/quantiles_calculation.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/quantiles_calculation" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/quantiles_calculation.pdf" "img/pdf/descriptive/quantiles_calculation.png"

img/pdf/descriptive/quantiles_calculation.pdf: img/pdf/descriptive/quantiles_calculation.md5
img/pdf/descriptive/range.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/range" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/range.pdf" "img/pdf/descriptive/range.png"

img/pdf/descriptive/range.pdf: img/pdf/descriptive/range.md5
img/pdf/descriptive/interquartile_range.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/interquartile_range" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/interquartile_range.pdf" "img/pdf/descriptive/interquartile_range.png"

img/pdf/descriptive/interquartile_range.pdf: img/pdf/descriptive/interquartile_range.md5
img/pdf/descriptive/boxplot.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/boxplot" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/boxplot.pdf" "img/pdf/descriptive/boxplot.png"

img/pdf/descriptive/boxplot.pdf: img/pdf/descriptive/boxplot.md5
img/pdf/descriptive/boxplot_children.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/boxplot_children" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/boxplot_children.pdf" "img/pdf/descriptive/boxplot_children.png"

img/pdf/descriptive/boxplot_children.pdf: img/pdf/descriptive/boxplot_children.md5
img/pdf/descriptive/deviations.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/deviations" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/deviations.pdf" "img/pdf/descriptive/deviations.png"

img/pdf/descriptive/deviations.pdf: img/pdf/descriptive/deviations.md5
img/pdf/descriptive/std_deviation_interpretation.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/std_deviation_interpretation" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/std_deviation_interpretation.pdf" "img/pdf/descriptive/std_deviation_interpretation.png"

img/pdf/descriptive/std_deviation_interpretation.pdf: img/pdf/descriptive/std_deviation_interpretation.md5
img/pdf/descriptive/symmetrical_distribution.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/symmetrical_distribution" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/symmetrical_distribution.pdf" "img/pdf/descriptive/symmetrical_distribution.png"

img/pdf/descriptive/symmetrical_distribution.pdf: img/pdf/descriptive/symmetrical_distribution.md5
img/pdf/descriptive/left_skewed_distribution.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/left_skewed_distribution" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/left_skewed_distribution.pdf" "img/pdf/descriptive/left_skewed_distribution.png"

img/pdf/descriptive/left_skewed_distribution.pdf: img/pdf/descriptive/left_skewed_distribution.md5
img/pdf/descriptive/right_skewed_distribution.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/right_skewed_distribution" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/right_skewed_distribution.pdf" "img/pdf/descriptive/right_skewed_distribution.png"

img/pdf/descriptive/right_skewed_distribution.pdf: img/pdf/descriptive/right_skewed_distribution.md5
img/pdf/descriptive/mesokurtic_distribution.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/mesokurtic_distribution" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/mesokurtic_distribution.pdf" "img/pdf/descriptive/mesokurtic_distribution.png"

img/pdf/descriptive/mesokurtic_distribution.pdf: img/pdf/descriptive/mesokurtic_distribution.md5
img/pdf/descriptive/platykurtic_distribution.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/platykurtic_distribution" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/platykurtic_distribution.pdf" "img/pdf/descriptive/platykurtic_distribution.png"

img/pdf/descriptive/platykurtic_distribution.pdf: img/pdf/descriptive/platykurtic_distribution.md5
img/pdf/descriptive/leptokurtic_distribution.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/leptokurtic_distribution" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/leptokurtic_distribution.pdf" "img/pdf/descriptive/leptokurtic_distribution.png"

img/pdf/descriptive/leptokurtic_distribution.pdf: img/pdf/descriptive/leptokurtic_distribution.md5
img/pdf/descriptive/square_transformation.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/square_transformation" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/square_transformation.pdf" "img/pdf/descriptive/square_transformation.png"

img/pdf/descriptive/square_transformation.pdf: img/pdf/descriptive/square_transformation.md5
img/pdf/descriptive/log_transformation.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/log_transformation" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/log_transformation.pdf" "img/pdf/descriptive/log_transformation.png"

img/pdf/descriptive/log_transformation.pdf: img/pdf/descriptive/log_transformation.md5
img/pdf/descriptive/factor_histogram.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/factor_histogram" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/factor_histogram.pdf" "img/pdf/descriptive/factor_histogram.png"

img/pdf/descriptive/factor_histogram.pdf: img/pdf/descriptive/factor_histogram.md5
img/pdf/descriptive/factor_box_plot.pdf: 
	pdflatex -shell-escape -halt-on-error -interaction=batchmode -jobname "img/pdf/descriptive/factor_box_plot" "\def\tikzexternalrealjob{statistics_course}\input{statistics_course}"; convert -density 300 -transparent white "img/pdf/descriptive/factor_box_plot.pdf" "img/pdf/descriptive/factor_box_plot.png"

img/pdf/descriptive/factor_box_plot.pdf: img/pdf/descriptive/factor_box_plot.md5
