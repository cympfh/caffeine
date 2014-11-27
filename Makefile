test:
	for f in samples/*.caf; do \
		./bin/caffeine $$f > /tmp/out && \
		diff /tmp/out $${f%caf}out; \
	done

