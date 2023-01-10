import React from "react"
import { render } from "@testing-library/react"
import ApartmentShow from "./ApartmentShow"
import { MemoryRouter, Routes, Route } from "react-router-dom"
import apartments from "../mockApartments"


const renderComponent = () => {
  render(
    <MemoryRouter initialEntries={["/apartmentshow/1"]} >
      <Routes> 
        <Route path="apartmentshow/:id" element={<ApartmentShow apartments={apartments}/>} />
      </Routes>
    </MemoryRouter>
  )
}

describe("<ApartmentShow />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(<ApartmentShow />, div)
  })
})
