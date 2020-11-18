local-antora-playbook.yml: antora-playbook.yml
	@sed -e 's/    - url: .*/    - url: ..\/morphia-docs\//' antora-playbook.yml > $@

local-site: local-antora-playbook.yml
	@npm local-build

site:
	@npm build

local: local-site

live: site

clean:
	@rm -rf build