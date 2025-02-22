class Patient

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def appointments
        Appointment.all.select{|app|
            app if app.patient == self}
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def self.all
        @@all
    end

    def doctors
        appointments.map{|app|
            app.doctor}
    end
end