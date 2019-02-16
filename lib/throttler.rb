class Throttler
  def initialize(requests_per_second)
    @requests_per_second = requests_per_second
    @time_between_requests = 1.0 / requests_per_second
  end

  def t
    throttle!
    yield
  end

  def throttle!
    if @last_request
      delta = Time.now - @last_request
      if delta < @time_between_requests
        sleep @time_between_requests - delta
      end
    end

    @last_request = Time.now
  end
end
