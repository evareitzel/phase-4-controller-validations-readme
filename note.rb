  # POST /birds
  def create
    bird = Bird.create(bird_params)
    if bird.valid?
      render json: bird, status: :created
    else
      render json: { error: bird.errors }, status: :unprocessable_entity
    end
  end

  # PATCH /birds/:id
  def update
    bird = find_bird
    bird.update(bird_params)
    render json: bird
  end

  #### using rescue keyword

    # POST /birds
    def create
      bird = Bird.create!(bird_params)
      render json: bird, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    # PATCH /birds/:id
    def update
      bird = find_bird
      bird.update!(bird_params)
      render json: bird
    rescue ActiveRecord::RecordInvalid => invalid
      render json: { errors: invalid.record.errors },  status: :unprocessable_entity
    end