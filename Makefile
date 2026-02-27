.PHONY: build clean preview

SITE_DIR := site
PORT     := 8000

build: $(SITE_DIR)/brochures/cali-lab-brochure.pdf $(SITE_DIR)/brochures/yog-lab-brochure.pdf
	@echo "Build complete → $(SITE_DIR)/"

$(SITE_DIR)/brochures/%.pdf: brochures/%.pdf
	@mkdir -p $(SITE_DIR)/brochures
	cp $< $@

clean:
	rm -rf $(SITE_DIR)/brochures
	@echo "Cleaned copied brochures from $(SITE_DIR)/"

preview:
	@echo "Serving $(SITE_DIR)/ at http://localhost:$(PORT)"
	@echo "Press Ctrl-C to stop."
	@python3 -m http.server $(PORT) --directory $(SITE_DIR)
