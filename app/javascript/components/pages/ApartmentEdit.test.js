import React from "react"
import { render } from "@testing-library/react"
import ApartmentEdit from "./ApartmentEdit"
import { MemoryRouter, Routes, Route } from "react-router-dom"
import mockApartments from "../mockApartments"

describe("<ApartmentEdit />", () => {
  beforeEach(() => {
    render(
        <MemoryRouter initialEntries={["/apartmentedit/1"]}>
          <Routes>
            <Route path="apartmentedit/:id" element={<ApartmentEdit apartments={mockApartments} />} />
          </Routes>
        </MemoryRouter>,
    )
})
it("renders without crashing", () => {})


})


