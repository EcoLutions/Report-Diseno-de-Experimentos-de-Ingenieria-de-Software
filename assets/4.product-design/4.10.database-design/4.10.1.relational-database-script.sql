-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-09-21 21:55:47.217

-- tables
-- Table: address_history
CREATE TABLE address_history (
    id bigint  NOT NULL,
    user_profile_id bigint  NOT NULL,
    street varchar(255)  NOT NULL,
    number varchar(20)  NOT NULL,
    district varchar(100)  NOT NULL,
    city varchar(100)  NOT NULL,
    region varchar(100)  NOT NULL,
    postal_code varchar(20)  NOT NULL,
    coordinates_latitude decimal(10,8)  NOT NULL,
    coordinates_longitude decimal(11,8)  NOT NULL,
    valid_from timestamp  NOT NULL,
    valid_to timestamp  NOT NULL,
    change_reason varchar(100)  NOT NULL,
    CONSTRAINT address_history_pk PRIMARY KEY (id)
);

-- Table: auth_tokens
CREATE TABLE auth_tokens (
    id bigint  NOT NULL,
    users_id bigint  NOT NULL,
    token_value varchar(255)  NOT NULL,
    token_type varchar(50)  NOT NULL,
    expiry_date timestamp  NOT NULL,
    is_revoked boolean  NOT NULL,
    created_at timestamp  NOT NULL,
    CONSTRAINT auth_tokens_pk PRIMARY KEY (id)
);

-- Table: citizen_rewards
CREATE TABLE citizen_rewards (
    citizen_id bigint  NOT NULL,
    reward_program_id bigint  NOT NULL,
    total_points int  NOT NULL,
    available_points int  NOT NULL,
    lifetime_earned int  NOT NULL,
    last_activity timestamp  NOT NULL,
    enrollment_date timestamp  NOT NULL,
    CONSTRAINT citizen_rewards_pk PRIMARY KEY (citizen_id,reward_program_id)
);

-- Table: citizens
CREATE TABLE citizens (
    id bigint  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    document_type varchar(50)  NOT NULL,
    document_number varchar(50)  NOT NULL,
    birth_date date  NOT NULL,
    email varchar(255)  NOT NULL,
    phone_number varchar(20)  NOT NULL,
    alternative_phone varchar(20)  NOT NULL,
    street varchar(255)  NOT NULL,
    number varchar(20)  NOT NULL,
    district varchar(100)  NOT NULL,
    city varchar(100)  NOT NULL,
    region varchar(100)  NOT NULL,
    postal_code varchar(20)  NOT NULL,
    registration_date timestamp  NOT NULL,
    membership_status varchar(50)  NOT NULL,
    engagement_level varchar(50)  NOT NULL,
    engagement_score decimal(5,2)  NOT NULL,
    language varchar(10)  NOT NULL,
    timezone varchar(50)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT citizens_pk PRIMARY KEY (id)
);

-- Table: contact_methods
CREATE TABLE contact_methods (
    id bigint  NOT NULL,
    user_profile_id bigint  NOT NULL,
    method_type varchar(50)  NOT NULL,
    value varchar(255)  NOT NULL,
    is_primary boolean  NOT NULL,
    is_verified boolean  NOT NULL,
    verification_date timestamp  NOT NULL,
    last_used_date timestamp  NOT NULL,
    CONSTRAINT contact_methods_pk PRIMARY KEY (id)
);

-- Table: containers
CREATE TABLE containers (
    id bigint  NOT NULL,
    location_latitude decimal(10,8)  NOT NULL,
    location_longitude decimal(11,8)  NOT NULL,
    capacity_volume_liters decimal(10,2)  NOT NULL,
    capacity_max_weight_kg decimal(10,2)  NOT NULL,
    current_fill_percentage decimal(5,2)  NOT NULL,
    status varchar(50)  NOT NULL,
    container_type varchar(50)  NOT NULL,
    last_collection_date timestamp  NOT NULL,
    municipality_id bigint  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT containers_pk PRIMARY KEY (id)
);

-- Table: delivery_attempts
CREATE TABLE delivery_attempts (
    id bigint  NOT NULL,
    notification_request_id bigint  NOT NULL,
    channel varchar(50)  NOT NULL,
    attempt_number int  NOT NULL,
    attempt_date timestamp  NOT NULL,
    status varchar(50)  NOT NULL,
    provider_response_code varchar(50)  NOT NULL,
    provider_response_message text  NOT NULL,
    error_code varchar(100)  NOT NULL,
    error_message text  NOT NULL,
    retry_date timestamp  NOT NULL,
    CONSTRAINT delivery_attempts_pk PRIMARY KEY (id)
);

-- Table: delivery_records
CREATE TABLE delivery_records (
    id bigint  NOT NULL,
    notification_request_id bigint  NOT NULL,
    channel varchar(50)  NOT NULL,
    provider_transaction varchar(255)  NOT NULL,
    status varchar(50)  NOT NULL,
    attempt_number int  NOT NULL,
    delivery_date timestamp  NOT NULL,
    confirmation_date timestamp  NOT NULL,
    failure_reason varchar(255)  NOT NULL,
    cost_amount decimal(10,2)  NOT NULL,
    cost_currency varchar(3)  NOT NULL,
    metadata json  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT delivery_records_pk PRIMARY KEY (id)
);

-- Table: district_resources
CREATE TABLE district_resources (
    district_id bigint  NOT NULL,
    resource_id bigint  NOT NULL,
    allocated_amount decimal(15,2)  NOT NULL,
    allocation_date timestamp  NOT NULL,
    allocation_period_start timestamp  NOT NULL,
    allocation_period_end timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    CONSTRAINT district_resources_pk PRIMARY KEY (district_id,resource_id)
);

-- Table: districts
CREATE TABLE districts (
    id bigint  NOT NULL,
    name varchar(255)  NOT NULL,
    municipality_id bigint  NOT NULL,
    boundary_coordinates json  NOT NULL,
    area_km2 decimal(10,3)  NOT NULL,
    population int  NOT NULL,
    budget_amount decimal(15,2)  NOT NULL,
    budget_currency varchar(3)  NOT NULL,
    budget_fiscal_year int  NOT NULL,
    operational_status varchar(50)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT districts_pk PRIMARY KEY (id)
);

-- Table: drivers
CREATE TABLE drivers (
    id bigint  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    document_type varchar(50)  NOT NULL,
    document_number varchar(50)  NOT NULL,
    date_of_birth date  NOT NULL,
    license_number varchar(50)  NOT NULL,
    license_type varchar(50)  NOT NULL,
    license_issue_date date  NOT NULL,
    license_expiry_date date  NOT NULL,
    employment_status varchar(50)  NOT NULL,
    district_id bigint  NOT NULL,
    phone_number varchar(20)  NOT NULL,
    email varchar(255)  NOT NULL,
    hire_date timestamp  NOT NULL,
    total_hours_per_week int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT drivers_pk PRIMARY KEY (id)
);

-- Table: invoice_line_items
CREATE TABLE invoice_line_items (
    id bigint  NOT NULL,
    invoice_id bigint  NOT NULL,
    description varchar(500)  NOT NULL,
    quantity int  NOT NULL,
    unit_price decimal(12,2)  NOT NULL,
    total_price decimal(12,2)  NOT NULL,
    tax_rate decimal(5,4)  NOT NULL,
    tax_amount decimal(12,2)  NOT NULL,
    line_order int  NOT NULL,
    CONSTRAINT invoice_line_items_pk PRIMARY KEY (id)
);

-- Table: invoices
CREATE TABLE invoices (
    id bigint  NOT NULL,
    subscription_id bigint  NOT NULL,
    invoice_number varchar(100)  NOT NULL,
    invoice_prefix varchar(20)  NOT NULL,
    invoice_sequence int  NOT NULL,
    billing_period_start date  NOT NULL,
    billing_period_end date  NOT NULL,
    issue_date timestamp  NOT NULL,
    due_date timestamp  NOT NULL,
    subtotal decimal(15,2)  NOT NULL,
    tax_amount decimal(15,2)  NOT NULL,
    total_amount decimal(15,2)  NOT NULL,
    status varchar(50)  NOT NULL,
    payment_id bigint  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT invoices_pk PRIMARY KEY (id)
);

-- Table: maintenance_records
CREATE TABLE maintenance_records (
    id bigint  NOT NULL,
    vehicle_id bigint  NOT NULL,
    maintenance_type varchar(100)  NOT NULL,
    scheduled_date date  NOT NULL,
    completed_date date  NOT NULL,
    description text  NOT NULL,
    cost_amount decimal(12,2)  NOT NULL,
    cost_currency varchar(3)  NOT NULL,
    status varchar(50)  NOT NULL,
    notes text  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT maintenance_records_pk PRIMARY KEY (id)
);

-- Table: message_templates
CREATE TABLE message_templates (
    id bigint  NOT NULL,
    name varchar(255)  NOT NULL,
    category varchar(100)  NOT NULL,
    message_type varchar(100)  NOT NULL,
    subject varchar(255)  NOT NULL,
    body_template text  NOT NULL,
    supported_channels json  NOT NULL,
    localization_content json  NOT NULL,
    template_version varchar(20)  NOT NULL,
    status varchar(50)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT message_templates_pk PRIMARY KEY (id)
);

-- Table: municipalities
CREATE TABLE municipalities (
    id bigint  NOT NULL,
    name varchar(255)  NOT NULL,
    code varchar(50)  NOT NULL,
    country varchar(100)  NOT NULL,
    region varchar(100)  NOT NULL,
    population int  NOT NULL,
    area_km2 decimal(10,3)  NOT NULL,
    contact_email varchar(255)  NOT NULL,
    contact_phone varchar(20)  NOT NULL,
    status varchar(50)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    route_id bigint  NOT NULL,
    CONSTRAINT municipalities_pk PRIMARY KEY (id)
);

-- Table: notification_requests
CREATE TABLE notification_requests (
    id bigint  NOT NULL,
    source_context_name varchar(100)  NOT NULL,
    source_context_id varchar(100)  NOT NULL,
    recipient_type varchar(50)  NOT NULL,
    message_type varchar(100)  NOT NULL,
    priority_level int  NOT NULL,
    message_template_id bigint  NOT NULL,
    template_data json  NOT NULL,
    scheduled_date timestamp  NOT NULL,
    expiry_date timestamp  NOT NULL,
    status varchar(50)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT notification_requests_pk PRIMARY KEY (id)
);

-- Table: notifications
CREATE TABLE notifications (
    id bigint  NOT NULL,
    citizen_id bigint  NOT NULL,
    notification_type varchar(100)  NOT NULL,
    title varchar(255)  NOT NULL,
    message text  NOT NULL,
    priority varchar(50)  NOT NULL,
    channel varchar(50)  NOT NULL,
    status varchar(50)  NOT NULL,
    scheduled_date timestamp  NOT NULL,
    sent_date timestamp  NOT NULL,
    read_date timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    CONSTRAINT notifications_pk PRIMARY KEY (id)
);

-- Table: optimization_results
CREATE TABLE optimization_results (
    id bigint  NOT NULL,
    route_id bigint  NOT NULL,
    algorithm_type varchar(100)  NOT NULL,
    execution_time_ms int  NOT NULL,
    total_distance_km decimal(10,3)  NOT NULL,
    estimated_fuel_consumption decimal(10,3)  NOT NULL,
    co2_emissions_kg decimal(10,3)  NOT NULL,
    cost_estimate decimal(12,2)  NOT NULL,
    optimization_score decimal(5,2)  NOT NULL,
    timestamp timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    CONSTRAINT optimization_results_pk PRIMARY KEY (id)
);

-- Table: payment_attempts
CREATE TABLE payment_attempts (
    id bigint  NOT NULL,
    payment_id bigint  NOT NULL,
    attempt_number int  NOT NULL,
    attempt_date timestamp  NOT NULL,
    status varchar(50)  NOT NULL,
    gateway_response_code varchar(50)  NOT NULL,
    gateway_response_message text  NOT NULL,
    error_code varchar(100)  NOT NULL,
    error_message text  NOT NULL,
    response_time_ms int  NOT NULL,
    CONSTRAINT payment_attempts_pk PRIMARY KEY (id)
);

-- Table: payment_methods
CREATE TABLE payment_methods (
    id bigint  NOT NULL,
    municipality_id bigint  NOT NULL,
    method_type varchar(50)  NOT NULL,
    card_number_masked varchar(20)  NOT NULL,
    card_expiry_date date  NOT NULL,
    card_holder_name varchar(255)  NOT NULL,
    bank_account_number varchar(50)  NOT NULL,
    bank_routing_number varchar(50)  NOT NULL,
    bank_account_holder_name varchar(255)  NOT NULL,
    bank_name varchar(255)  NOT NULL,
    is_default boolean  NOT NULL,
    is_active boolean  NOT NULL,
    expiry_date timestamp  NOT NULL,
    last_used_date timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT payment_methods_pk PRIMARY KEY (id)
);

-- Table: payments
CREATE TABLE payments (
    id bigint  NOT NULL,
    subscription_id bigint  NOT NULL,
    amount decimal(15,2)  NOT NULL,
    currency varchar(3)  NOT NULL,
    payment_method_type varchar(50)  NOT NULL,
    status varchar(50)  NOT NULL,
    gateway_response_code varchar(50)  NOT NULL,
    gateway_response_message text  NOT NULL,
    gateway_timestamp timestamp  NOT NULL,
    attempt_number int  NOT NULL,
    scheduled_date timestamp  NOT NULL,
    processed_date timestamp  NOT NULL,
    failure_reason varchar(255)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT payments_pk PRIMARY KEY (id)
);

-- Table: permissions
CREATE TABLE permissions (
    id bigint  NOT NULL,
    name varchar(100)  NOT NULL,
    description text  NOT NULL,
    resource varchar(100)  NOT NULL,
    action varchar(100)  NOT NULL,
    scope varchar(100)  NOT NULL,
    created_at timestamp  NOT NULL,
    CONSTRAINT permissions_pk PRIMARY KEY (id)
);

-- Table: personalization_settings
CREATE TABLE personalization_settings (
    id bigint  NOT NULL,
    user_profile_id bigint  NOT NULL,
    dashboard_layout json  NOT NULL,
    view_preferences json  NOT NULL,
    reporting_preferences json  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT personalization_settings_pk PRIMARY KEY (id)
);

-- Table: recipient_preferences
CREATE TABLE recipient_preferences (
    id bigint  NOT NULL,
    recipient_type varchar(50)  NOT NULL,
    preferred_channels json  NOT NULL,
    blocked_channels json  NOT NULL,
    quiet_hours_start time  NOT NULL,
    quiet_hours_end time  NOT NULL,
    quiet_hours_timezone varchar(50)  NOT NULL,
    language varchar(10)  NOT NULL,
    timezone varchar(50)  NOT NULL,
    frequency varchar(50)  NOT NULL,
    is_active boolean  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT recipient_preferences_pk PRIMARY KEY (id)
);

-- Table: report_images
CREATE TABLE report_images (
    id bigint  NOT NULL,
    report_id bigint  NOT NULL,
    file_name varchar(255)  NOT NULL,
    file_content bytea  NOT NULL,
    file_size_bytes bigint  NOT NULL,
    mime_type varchar(100)  NOT NULL,
    description text  NOT NULL,
    uploaded_date timestamp  NOT NULL,
    CONSTRAINT report_images_pk PRIMARY KEY (id)
);

-- Table: reports
CREATE TABLE reports (
    id bigint  NOT NULL,
    citizen_id bigint  NOT NULL,
    report_type varchar(100)  NOT NULL,
    category varchar(100)  NOT NULL,
    description text  NOT NULL,
    location_latitude decimal(10,8)  NOT NULL,
    location_longitude decimal(11,8)  NOT NULL,
    priority_level int  NOT NULL,
    status varchar(50)  NOT NULL,
    container_id bigint  NOT NULL,
    submission_date timestamp  NOT NULL,
    resolution_date timestamp  NOT NULL,
    feedback_rating int  NOT NULL,
    feedback_comments text  NOT NULL,
    feedback_date timestamp  NOT NULL,
    administrator_notes text  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT reports_pk PRIMARY KEY (id)
);

-- Table: resources
CREATE TABLE resources (
    id bigint  NOT NULL,
    resource_type varchar(50)  NOT NULL,
    name varchar(255)  NOT NULL,
    description text  NOT NULL,
    max_capacity decimal(15,2)  NOT NULL,
    capacity_unit varchar(50)  NOT NULL,
    current_usage decimal(15,2)  NOT NULL,
    status varchar(50)  NOT NULL,
    acquisition_cost decimal(15,2)  NOT NULL,
    maintenance_cost decimal(15,2)  NOT NULL,
    location_latitude decimal(10,8)  NOT NULL,
    location_longitude decimal(11,8)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT resources_pk PRIMARY KEY (id)
);

-- Table: rewards_programs
CREATE TABLE rewards_programs (
    id bigint  NOT NULL,
    name varchar(255)  NOT NULL,
    description text  NOT NULL,
    is_active boolean  NOT NULL,
    start_date timestamp  NOT NULL,
    end_date timestamp  NOT NULL,
    total_points_awarded int  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT rewards_programs_pk PRIMARY KEY (id)
);

-- Table: role_permissions
CREATE TABLE role_permissions (
    role_id bigint  NOT NULL,
    permission_id bigint  NOT NULL,
    CONSTRAINT role_permissions_pk PRIMARY KEY (role_id,permission_id)
);

-- Table: roles
CREATE TABLE roles (
    id bigint  NOT NULL,
    name varchar(100)  NOT NULL,
    description text  NOT NULL,
    is_default boolean  NOT NULL,
    is_system_role boolean  NOT NULL,
    created_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT roles_pk PRIMARY KEY (id)
);

-- Table: routes
CREATE TABLE routes (
    id bigint  NOT NULL,
    name varchar(255)  NOT NULL,
    driver_id bigint  NOT NULL,
    vehicle_id bigint  NOT NULL,
    route_type varchar(50)  NOT NULL,
    status varchar(50)  NOT NULL,
    scheduled_date timestamp  NOT NULL,
    start_time timestamp  NOT NULL,
    end_time timestamp  NOT NULL,
    estimated_duration_minutes int  NOT NULL,
    actual_duration_minutes int  NOT NULL,
    total_distance_km decimal(10,3)  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT routes_pk PRIMARY KEY (id)
);

-- Table: sensor_readings
CREATE TABLE sensor_readings (
    id bigint  NOT NULL,
    container_id bigint  NOT NULL,
    sensor_id varchar(100)  NOT NULL,
    timestamp timestamp  NOT NULL,
    fill_level_percentage decimal(5,2)  NOT NULL,
    temperature_celsius decimal(5,2)  NOT NULL,
    battery_level decimal(5,2)  NOT NULL,
    signal_strength decimal(5,2)  NOT NULL,
    health_status varchar(50)  NOT NULL,
    is_validated boolean  NOT NULL,
    created_at timestamp  NOT NULL,
    CONSTRAINT sensor_readings_pk PRIMARY KEY (id)
);

-- Table: subscriptions
CREATE TABLE subscriptions (
    id bigint  NOT NULL,
    municipality_id bigint  NOT NULL,
    status varchar(50)  NOT NULL,
    start_date timestamp  NOT NULL,
    end_date timestamp  NOT NULL,
    next_billing_date timestamp  NOT NULL,
    payment_method_id bigint  NOT NULL,
    billing_street varchar(255)  NOT NULL,
    billing_city varchar(100)  NOT NULL,
    billing_state varchar(100)  NOT NULL,
    billing_postal_code varchar(20)  NOT NULL,
    billing_country varchar(100)  NOT NULL,
    billing_cycle_type varchar(50)  NOT NULL,
    billing_interval_months int  NOT NULL,
    trial_end_date timestamp  NOT NULL,
    auto_renewal boolean  NOT NULL,
    grace_period_end_date timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT subscriptions_pk PRIMARY KEY (id)
);

-- Table: user_preferences
CREATE TABLE user_preferences (
    id bigint  NOT NULL,
    user_profile_id bigint  NOT NULL,
    email_notifications boolean  NOT NULL,
    sms_notifications boolean  NOT NULL,
    push_notifications boolean  NOT NULL,
    in_app_notifications boolean  NOT NULL,
    quiet_hours_start time  NOT NULL,
    quiet_hours_end time  NOT NULL,
    notification_frequency varchar(50)  NOT NULL,
    communication_channels json  NOT NULL,
    language_preference varchar(10)  NOT NULL,
    timezone_preference varchar(50)  NOT NULL,
    theme_preference varchar(50)  NOT NULL,
    accessibility_settings json  NOT NULL,
    data_retention_settings json  NOT NULL,
    marketing_consent boolean  NOT NULL,
    marketing_consent_date timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT user_preferences_pk PRIMARY KEY (id)
);

-- Table: user_profiles
CREATE TABLE user_profiles (
    id bigint  NOT NULL,
    user_id bigint  NOT NULL,
    user_type varchar(50)  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    document_type varchar(50)  NOT NULL,
    document_number varchar(50)  NOT NULL,
    birth_date date  NOT NULL,
    gender varchar(20)  NOT NULL,
    primary_email varchar(255)  NOT NULL,
    secondary_email varchar(255)  NOT NULL,
    primary_phone varchar(20)  NOT NULL,
    secondary_phone varchar(20)  NOT NULL,
    emergency_contact_name varchar(255)  NOT NULL,
    emergency_contact_phone varchar(20)  NOT NULL,
    street varchar(255)  NOT NULL,
    number varchar(20)  NOT NULL,
    district varchar(100)  NOT NULL,
    city varchar(100)  NOT NULL,
    region varchar(100)  NOT NULL,
    postal_code varchar(20)  NOT NULL,
    coordinates_latitude decimal(10,8)  NOT NULL,
    coordinates_longitude decimal(11,8)  NOT NULL,
    service_area varchar(100)  NOT NULL,
    status varchar(50)  NOT NULL,
    profile_visibility varchar(50)  NOT NULL,
    data_sharing_level varchar(50)  NOT NULL,
    analytics_tracking boolean  NOT NULL,
    marketing_communications boolean  NOT NULL,
    third_party_sharing boolean  NOT NULL,
    completion_percentage decimal(5,2)  NOT NULL,
    missing_fields json  NOT NULL,
    last_login_date timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT user_profiles_pk PRIMARY KEY (id)
);

-- Table: user_roles
CREATE TABLE user_roles (
    user_id bigint  NOT NULL,
    role_id bigint  NOT NULL,
    assigned_date timestamp  NOT NULL,
    assigned_by varchar(50)  NOT NULL,
    CONSTRAINT user_roles_pk PRIMARY KEY (user_id,role_id)
);

-- Table: users
CREATE TABLE users (
    id bigint  NOT NULL,
    username varchar(100)  NOT NULL,
    email varchar(255)  NOT NULL,
    password_hash varchar(255)  NOT NULL,
    password_salt varchar(100)  NOT NULL,
    password_algorithm varchar(50)  NOT NULL,
    status varchar(50)  NOT NULL,
    first_name varchar(100)  NOT NULL,
    last_name varchar(100)  NOT NULL,
    display_name varchar(255)  NOT NULL,
    avatar_url varchar(255)  NOT NULL,
    two_factor_enabled boolean  NOT NULL,
    last_password_change timestamp  NOT NULL,
    password_history json  NOT NULL,
    security_questions json  NOT NULL,
    created_at timestamp  NOT NULL,
    last_login_at timestamp  NOT NULL,
    failed_login_attempts int  NOT NULL,
    lockout_time timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (id)
);

-- Table: vehicles
CREATE TABLE vehicles (
    id bigint  NOT NULL,
    registration_number varchar(50)  NOT NULL,
    vehicle_type varchar(50)  NOT NULL,
    capacity_volume_m3 decimal(10,2)  NOT NULL,
    capacity_weight_kg decimal(10,2)  NOT NULL,
    fuel_type varchar(50)  NOT NULL,
    status varchar(50)  NOT NULL,
    district_id bigint  NOT NULL,
    driver_id bigint  NOT NULL,
    gps_latitude decimal(10,8)  NOT NULL,
    gps_longitude decimal(11,8)  NOT NULL,
    last_inspection_date timestamp  NOT NULL,
    next_maintenance_date timestamp  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    version bigint  NOT NULL,
    CONSTRAINT vehicles_pk PRIMARY KEY (id)
);

-- Table: waypoints
CREATE TABLE waypoints (
    id bigint  NOT NULL,
    route_id bigint  NOT NULL,
    container_id bigint  NOT NULL,
    location_latitude decimal(10,8)  NOT NULL,
    location_longitude decimal(11,8)  NOT NULL,
    priority_level int  NOT NULL,
    sequence_order int  NOT NULL,
    estimated_arrival_time timestamp  NOT NULL,
    actual_arrival_time timestamp  NOT NULL,
    estimated_service_minutes int  NOT NULL,
    actual_service_minutes int  NOT NULL,
    status varchar(50)  NOT NULL,
    collection_instructions text  NOT NULL,
    created_at timestamp  NOT NULL,
    updated_at timestamp  NOT NULL,
    CONSTRAINT waypoints_pk PRIMARY KEY (id)
);

-- Table: widget_configurations
CREATE TABLE widget_configurations (
    id bigint  NOT NULL,
    personalization_setting_id bigint  NOT NULL,
    widget_type varchar(100)  NOT NULL,
    position_x int  NOT NULL,
    position_y int  NOT NULL,
    size_width int  NOT NULL,
    size_height int  NOT NULL,
    configuration json  NOT NULL,
    is_visible boolean  NOT NULL,
    refresh_interval_minutes int  NOT NULL,
    CONSTRAINT widget_configurations_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: address_history_user_profiles (table: address_history)
ALTER TABLE address_history ADD CONSTRAINT address_history_user_profiles
    FOREIGN KEY (user_profile_id)
    REFERENCES user_profiles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: auth_tokens_users (table: auth_tokens)
ALTER TABLE auth_tokens ADD CONSTRAINT auth_tokens_users
    FOREIGN KEY (users_id)
    REFERENCES users (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: citizen_rewards_citizens (table: citizen_rewards)
ALTER TABLE citizen_rewards ADD CONSTRAINT citizen_rewards_citizens
    FOREIGN KEY (citizen_id)
    REFERENCES citizens (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: citizen_rewards_rewards_programs (table: citizen_rewards)
ALTER TABLE citizen_rewards ADD CONSTRAINT citizen_rewards_rewards_programs
    FOREIGN KEY (reward_program_id)
    REFERENCES rewards_programs (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: contact_methods_user_profiles (table: contact_methods)
ALTER TABLE contact_methods ADD CONSTRAINT contact_methods_user_profiles
    FOREIGN KEY (user_profile_id)
    REFERENCES user_profiles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: containers_municipalities (table: containers)
ALTER TABLE containers ADD CONSTRAINT containers_municipalities
    FOREIGN KEY (municipality_id)
    REFERENCES municipalities (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: delivery_attempts_notification_requests (table: delivery_attempts)
ALTER TABLE delivery_attempts ADD CONSTRAINT delivery_attempts_notification_requests
    FOREIGN KEY (notification_request_id)
    REFERENCES notification_requests (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: delivery_records_notification_requests (table: delivery_records)
ALTER TABLE delivery_records ADD CONSTRAINT delivery_records_notification_requests
    FOREIGN KEY (notification_request_id)
    REFERENCES notification_requests (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: district_resources_districts (table: district_resources)
ALTER TABLE district_resources ADD CONSTRAINT district_resources_districts
    FOREIGN KEY (district_id)
    REFERENCES districts (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: district_resources_resources (table: district_resources)
ALTER TABLE district_resources ADD CONSTRAINT district_resources_resources
    FOREIGN KEY (resource_id)
    REFERENCES resources (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: districts_municipalities (table: districts)
ALTER TABLE districts ADD CONSTRAINT districts_municipalities
    FOREIGN KEY (municipality_id)
    REFERENCES municipalities (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: drivers_districts (table: drivers)
ALTER TABLE drivers ADD CONSTRAINT drivers_districts
    FOREIGN KEY (district_id)
    REFERENCES districts (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: invoice_line_items_invoices (table: invoice_line_items)
ALTER TABLE invoice_line_items ADD CONSTRAINT invoice_line_items_invoices
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: invoices_payments (table: invoices)
ALTER TABLE invoices ADD CONSTRAINT invoices_payments
    FOREIGN KEY (payment_id)
    REFERENCES payments (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: invoices_subscriptions (table: invoices)
ALTER TABLE invoices ADD CONSTRAINT invoices_subscriptions
    FOREIGN KEY (subscription_id)
    REFERENCES subscriptions (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: maintenance_records_vehicles (table: maintenance_records)
ALTER TABLE maintenance_records ADD CONSTRAINT maintenance_records_vehicles
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: municipalities_routes (table: municipalities)
ALTER TABLE municipalities ADD CONSTRAINT municipalities_routes
    FOREIGN KEY (route_id)
    REFERENCES routes (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: notification_requests_message_templates (table: notification_requests)
ALTER TABLE notification_requests ADD CONSTRAINT notification_requests_message_templates
    FOREIGN KEY (message_template_id)
    REFERENCES message_templates (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: notifications_citizens (table: notifications)
ALTER TABLE notifications ADD CONSTRAINT notifications_citizens
    FOREIGN KEY (citizen_id)
    REFERENCES citizens (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: optimization_results_routes (table: optimization_results)
ALTER TABLE optimization_results ADD CONSTRAINT optimization_results_routes
    FOREIGN KEY (route_id)
    REFERENCES routes (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: payment_attempts_payments (table: payment_attempts)
ALTER TABLE payment_attempts ADD CONSTRAINT payment_attempts_payments
    FOREIGN KEY (payment_id)
    REFERENCES payments (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: payment_methods_municipalities (table: payment_methods)
ALTER TABLE payment_methods ADD CONSTRAINT payment_methods_municipalities
    FOREIGN KEY (municipality_id)
    REFERENCES municipalities (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: payments_subscriptions (table: payments)
ALTER TABLE payments ADD CONSTRAINT payments_subscriptions
    FOREIGN KEY (subscription_id)
    REFERENCES subscriptions (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: personalization_settings_user_profiles (table: personalization_settings)
ALTER TABLE personalization_settings ADD CONSTRAINT personalization_settings_user_profiles
    FOREIGN KEY (user_profile_id)
    REFERENCES user_profiles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: report_images_reports (table: report_images)
ALTER TABLE report_images ADD CONSTRAINT report_images_reports
    FOREIGN KEY (report_id)
    REFERENCES reports (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reports_citizens (table: reports)
ALTER TABLE reports ADD CONSTRAINT reports_citizens
    FOREIGN KEY (citizen_id)
    REFERENCES citizens (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: reports_containers (table: reports)
ALTER TABLE reports ADD CONSTRAINT reports_containers
    FOREIGN KEY (container_id)
    REFERENCES containers (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: role_permissions_permissions (table: role_permissions)
ALTER TABLE role_permissions ADD CONSTRAINT role_permissions_permissions
    FOREIGN KEY (permission_id)
    REFERENCES permissions (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: role_permissions_roles (table: role_permissions)
ALTER TABLE role_permissions ADD CONSTRAINT role_permissions_roles
    FOREIGN KEY (role_id)
    REFERENCES roles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: routes_driver (table: routes)
ALTER TABLE routes ADD CONSTRAINT routes_driver
    FOREIGN KEY (driver_id)
    REFERENCES drivers (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: routes_vehicle (table: routes)
ALTER TABLE routes ADD CONSTRAINT routes_vehicle
    FOREIGN KEY (vehicle_id)
    REFERENCES vehicles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: sensor_readings_containers (table: sensor_readings)
ALTER TABLE sensor_readings ADD CONSTRAINT sensor_readings_containers
    FOREIGN KEY (container_id)
    REFERENCES containers (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subscriptions_municipalities (table: subscriptions)
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_municipalities
    FOREIGN KEY (municipality_id)
    REFERENCES municipalities (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: subscriptions_payment_methods (table: subscriptions)
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_payment_methods
    FOREIGN KEY (payment_method_id)
    REFERENCES payment_methods (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: user_preferences_user_profiles (table: user_preferences)
ALTER TABLE user_preferences ADD CONSTRAINT user_preferences_user_profiles
    FOREIGN KEY (user_profile_id)
    REFERENCES user_profiles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: user_profiles_users (table: user_profiles)
ALTER TABLE user_profiles ADD CONSTRAINT user_profiles_users
    FOREIGN KEY (user_id)
    REFERENCES users (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: user_roles_roles (table: user_roles)
ALTER TABLE user_roles ADD CONSTRAINT user_roles_roles
    FOREIGN KEY (role_id)
    REFERENCES roles (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: user_roles_users (table: user_roles)
ALTER TABLE user_roles ADD CONSTRAINT user_roles_users
    FOREIGN KEY (user_id)
    REFERENCES users (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: vehicles_districts (table: vehicles)
ALTER TABLE vehicles ADD CONSTRAINT vehicles_districts
    FOREIGN KEY (district_id)
    REFERENCES districts (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: vehicles_drivers (table: vehicles)
ALTER TABLE vehicles ADD CONSTRAINT vehicles_drivers
    FOREIGN KEY (driver_id)
    REFERENCES drivers (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: waypoints_containers (table: waypoints)
ALTER TABLE waypoints ADD CONSTRAINT waypoints_containers
    FOREIGN KEY (container_id)
    REFERENCES containers (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: waypoints_routes (table: waypoints)
ALTER TABLE waypoints ADD CONSTRAINT waypoints_routes
    FOREIGN KEY (route_id)
    REFERENCES routes (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: widget_configurations_personalization_settings (table: widget_configurations)
ALTER TABLE widget_configurations ADD CONSTRAINT widget_configurations_personalization_settings
    FOREIGN KEY (personalization_setting_id)
    REFERENCES personalization_settings (id)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

