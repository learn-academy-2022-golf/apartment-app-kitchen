import React from "react"
import { render, screen } from "@testing-library/react"
import ApartmentNew from "./ApartmentNew"
import { BrowserRouter } from "react-router-dom"

describe("<ApartmentNew />", () => {
  it("renders without crashing", () => {
    const div = document.createElement("div")
    render(
      <BrowserRouter>
        <ApartmentNew />
      </BrowserRouter>,
     div)
     expect(screen.getByText("Please log in to add an apartment listing")).toBeInTheDocument
  })
})
