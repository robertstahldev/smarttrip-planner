-- CreateTable
CREATE TABLE `activities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `category` VARCHAR(255) NULL,
    `default_duration_hours` DECIMAL(5, 2) NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT (now()),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cost_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `trip_id` INTEGER NOT NULL,
    `label` VARCHAR(255) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL,
    `paid_by` INTEGER NOT NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT (now()),

    INDEX `cost_items_index_10`(`paid_by`),
    INDEX `cost_items_index_9`(`trip_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invites` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `trip_id` INTEGER NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `token` VARCHAR(255) NOT NULL,
    `expires_at` TIMESTAMP(0) NOT NULL,
    `accepted_at` TIMESTAMP(0) NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT (now()),

    UNIQUE INDEX `token`(`token`),
    INDEX `invites_index_7`(`trip_id`),
    INDEX `invites_index_8`(`token`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `itinerary_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `trip_id` INTEGER NOT NULL,
    `day_index` INTEGER NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT NULL,
    `start_time` TIME(0) NULL,
    `end_time` TIME(0) NULL,
    `duration_hours` DECIMAL(5, 2) NULL,
    `location_name` VARCHAR(255) NULL,
    `google_place_id` VARCHAR(255) NULL,
    `activity_type` VARCHAR(255) NULL,
    `participants_json` JSON NULL,
    `equipment_list` JSON NULL,
    `food_plan` TEXT NULL,
    `transport_mode` VARCHAR(255) NULL,
    `notes` TEXT NULL,
    `sort_order` INTEGER NULL,
    `created_by` INTEGER NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT (now()),
    `updated_by` INTEGER NULL,
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `itinerary_items_index_3`(`trip_id`),
    INDEX `itinerary_items_index_4`(`created_by`),
    INDEX `itinerary_items_index_5`(`trip_id`, `day_index`),
    INDEX `updated_by`(`updated_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trip_members` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `trip_id` INTEGER NOT NULL,
    `role` VARCHAR(255) NOT NULL,
    `joined_at` TIMESTAMP(0) NULL DEFAULT (now()),

    INDEX `trip_id`(`trip_id`),
    UNIQUE INDEX `trip_members_index_2`(`user_id`, `trip_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `trips` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `creator_id` INTEGER NOT NULL,
    `location` VARCHAR(255) NULL,
    `start_date` DATE NULL,
    `end_date` DATE NULL,
    `notes` TEXT NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT (now()),
    `updated_at` TIMESTAMP(0) NULL,

    INDEX `trips_index_0`(`creator_id`),
    INDEX `trips_index_1`(`start_date`, `end_date`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NULL,
    `last_name` VARCHAR(255) NULL,
    `email` VARCHAR(255) NOT NULL,
    `password_hash` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP(0) NULL DEFAULT (now()),

    UNIQUE INDEX `email`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `cost_items` ADD CONSTRAINT `cost_items_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `cost_items` ADD CONSTRAINT `cost_items_ibfk_2` FOREIGN KEY (`paid_by`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `invites` ADD CONSTRAINT `invites_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `itinerary_items` ADD CONSTRAINT `itinerary_items_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trips`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `itinerary_items` ADD CONSTRAINT `itinerary_items_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `itinerary_items` ADD CONSTRAINT `itinerary_items_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trip_members` ADD CONSTRAINT `trip_members_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trip_members` ADD CONSTRAINT `trip_members_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trips`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `trips` ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
