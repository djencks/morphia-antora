local-antora-playbook.yml: antora-playbook.yml
	@sed -e 's/    - url: .*/    - url: ..\/morphia-docs\//' antora-playbook.yml > $@

javadoc:
	@echo

bin/htmltest:
	curl https://htmltest.wjdp.uk | bash

check-links: bin/htmltest site
	cd build ; ../bin/htmltest .

local-site: local-antora-playbook.yml
	@antora local-antora-playbook.yml

site:
	antora antora-playbook.yml

local: local-site javadoc

live: site javadoc

clean:
	@rm -rf build