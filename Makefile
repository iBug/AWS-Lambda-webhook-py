DEPS_DIR = packages
ZIP_FILE = package.zip

.PHONY: all install-deps package deploy clean clean-all

all: deploy

install-deps: requirements.txt
	@mkdir -p $(DEPS_DIR)
	pip3 install -t $(DEPS_DIR) -r $<

package: $(ZIP_FILE)

deploy: $(ZIP_FILE)
	AWS_DEFAULT_REGION=us-east-1 aws lambda update-function-code --function-name GitHubWebhook --zip-file fileb://$<

$(ZIP_FILE): $(wildcard *.py)
	( cd $(DEPS_DIR); zip -r ../$@ ./ )
	zip -g $@ $^

clean:
	rm -f $(ZIP_FILE)

clean-all:
	rm -f $(ZIP_FILE) $(DEPS_DIR)
