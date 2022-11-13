# frozen_string_literal: true
class UpdateGoodJobs < ActiveRecord::Migration[7.0]
  def change
    change_table :good_jobs, bulk: true do |t|
      t.column :active_job_id, :uuid
      t.column :concurrency_key, :text
      t.column :cron_key, :text
      t.column :retried_good_job_id, :uuid
      t.column :cron_at, :datetime
    end

    create_table :good_job_processes, id: :uuid do |t|
      t.timestamps
      t.jsonb :state
    end

    add_index :good_jobs, [:active_job_id, :created_at], name: :index_good_jobs_on_active_job_id_and_created_at
    add_index :good_jobs, :concurrency_key, where: "(finished_at IS NULL)", name: :index_good_jobs_on_concurrency_key_when_unfinished
    add_index :good_jobs, [:cron_key, :created_at], name: :index_good_jobs_on_cron_key_and_created_at
    add_index :good_jobs, [:cron_key, :cron_at], name: :index_good_jobs_on_cron_key_and_cron_at, unique: true
    add_index :good_jobs, [:active_job_id], name: :index_good_jobs_on_active_job_id
    add_index :good_jobs, [:finished_at], where: "retried_good_job_id IS NULL AND finished_at IS NOT NULL", name: :index_good_jobs_jobs_on_finished_at
  end
end
