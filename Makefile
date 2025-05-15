-include .env.local
export

test:
	docker compose down -v && \
	docker compose up -d && \
	sleep 10 && \
	docker compose exec odoo odoo --test-enable \
	--stop-after-init --test-tags $(MODULE) \
	-i $(MODULE) \
	--without-demo=all -d veterinaries --db_host pg --db_user odoo --db_password odoo
