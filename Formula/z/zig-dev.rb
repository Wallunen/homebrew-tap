class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260411-163106"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "20168af3199f6e854b75947cba61498b6d9315139c4ca64f40ab93e4263d8f00"
    sha256 cellar: :any_skip_relocation, sequoia:      "853a2c1fa4877cd4988e1958534cd876d520708bf96fa779b2ddf1a3f2b9ff65"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "441230b43a0cb1f10e56bab47afbc8ca8a3530bf5084a5b694be639251762cc3"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a8d0edc61a8e2dadf4e0a3b6bec05c68e1bd95cc64a6067a7355226a338eca15" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "a68477abba5bd20ebb61c7e3923fac4b56862f86d36388e2eed5b81c7c36c3d9" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ba33fa7fd8b83a907ea22c0f79c1e2fbe8ca2e6c2472c706b84748abe559cf67" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.16.0-dev.3144+ac6fb0b59.tar.xz"
  version "0.16.0-dev.3144+ac6fb0b59"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
