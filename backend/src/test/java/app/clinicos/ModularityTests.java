package app.clinicos;

import org.junit.jupiter.api.Test;
import org.springframework.modulith.core.ApplicationModules;

public class ModularityTests {

    @Test
    void verifiesModuleStructure() {
        ApplicationModules.of(ClinicOsApplication.class).verify();
    }
}
